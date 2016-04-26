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
        $cash_result= CS50::query("SELECT cash from users WHERE id = ?", $id );
        $balance =  number_format( $cash_result[0]['cash'], 2);
    
        //  render add_cash_form.php with this balance
        render("add_cash_form.php", ["balance" => $balance]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // Add requested cash to balance
        $amount = $_POST["amount"];
        if ( $amount == null )
            Apologize("Please enter an amount- it's free!");
        
        if (! is_numeric( $amount ) )
            Apologize("Please enter a number. I cannot give you $amount");
            
        if (is_numeric( $amount ) )
        {
            CS50::query("UPDATE users SET cash = cash + $amount WHERE id = $id ");
                    // Log the transaction in our history table
            CS50::query("INSERT INTO history (user_id, symbol, shares, share_price, transaction_type, datetime) 
            VALUES(?, ?, ?, ?, 3, now())", $id, $symbol, $requested_shares, $price_per_share);
            
            redirect("/");
        }
    }
    
?>