<?php

    // configuration
    require("../includes/config.php");
    
    // save user id locally since we'll use it a couple times
    $id = $_SESSION["id"];
    
    // refactored to call the database only once for the portfolio :):)
    $user_portfolio_rows = CS50::query("SELECT * FROM portfolios WHERE user_id = ? " ,  $id);
    
    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // make an array of the stocks this user owns, to pass to the view
        $stocks = [];
        foreach ($user_portfolio_rows as $row)
        {
            $stock = lookup($row["symbol"]);
            if ($stock !== false)
            {
                $stocks[] = [
                    "symbol" => $row["symbol"]
                ];
            }
        }
        
        //  render form with those stocks
        render("sell_form.php", ["stocks" => $stocks]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // Make sure we have a stock from the POST info
        
            if ( ($_POST["symbol"]) == null )
                Apologize("You must select a stock to sell");
        
        // sell it!
    
        // save symbol locally since we'll use it a couple times
        $symbol = $_POST["symbol"];

        // lookup the price for this stock
        // don't use number_format this time- we want to preserve accuracy
        $stock_info = lookup($symbol);   
        $price_per_share = $stock_info['price'] ;
        
        // Get the number of shares the user has for this stock
        foreach ($user_portfolio_rows as $row)
        {
            if ($row['symbol'] == $symbol)
            {
                $shares = $row['shares'];
                $line_to_sell = $row['id'];
            }
        }
        
        // Get the total value, and add it to the user's cash
        $adding_amt = ($price_per_share * $shares);
        CS50::query("UPDATE users SET cash = cash + $adding_amt WHERE id = $id ");
        
        // delete the row from portfolio
        $delete_attempt = CS50::query("DELETE from portfolios where id = ?", $line_to_sell); 
        
        // Log the transaction in our history table
        CS50::query("INSERT INTO history (user_id, symbol, shares, share_price, transaction_type, datetime) 
            VALUES(?, ?, ?, ?, 2, now())", $id, $symbol, $shares, $price_per_share);

        // redirect to index.php
        redirect("/");

    }
    
?>