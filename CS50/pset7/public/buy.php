<?php

    // configuration
    require("../includes/config.php");
    
    // save user id locally since we'll use it a couple times
    $id = $_SESSION["id"];
    

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("buy_form.php");
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // Make sure we have a stock and a shares amount
        if ( ($_POST["symbol"] == null ) || ($_POST["shares"] == null) )
            Apologize("Please specify the stock and number of shares");
        
        // Otherwise save what we got and get to work
        $symbol = strtoupper($_POST["symbol"]);
        $requested_shares = $_POST["shares"];
        
        // get the current cash balance that this user has
        $user_cash_result= CS50::query("SELECT cash FROM users WHERE id = ? ",  $id);        
        $user_cash_before = $user_cash_result[0]['cash'];
        
        // get the current price of the selected stock
        $stock_info = lookup($symbol);   
        $price_per_share = $stock_info['price'] ;
        $purchase_amount = $price_per_share * $requested_shares;
        
        $max_possible = number_format ($user_cash_before / $price_per_share, 0);
        
        // If too expensive, prompt the user // Added telling them how many they CAN buy
        if ($purchase_amount > $user_cash_before)
            apologize("The most $symbol shares you can afford is $max_possible. ");

        // otherwise, we buy it! 
        
        // Add a portfolio row for this stock, or update number of shares if they have some already
        CS50::query("INSERT INTO portfolios (user_id, symbol, shares) VALUES (?, ?, ?)
            ON DUPLICATE KEY UPDATE shares = (shares + $requested_shares)  " ,  $id, $symbol, $requested_shares ); 
        
        // Log the transaction in our history table
        CS50::query("INSERT INTO history (user_id, symbol, shares, share_price, transaction_type, datetime) 
            VALUES(?, ?, ?, ?, 1, now())", $id, $symbol, $requested_shares, $price_per_share);

        // subtract that amount from their cash
        CS50::query("UPDATE users SET cash = cash - $purchase_amount WHERE id = $id ");
           
        // redirect to index.php
        redirect("/");
    }
    
?>