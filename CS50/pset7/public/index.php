<?php

    // configuration
    require("../includes/config.php"); 

    // look up what we have for the logged in user
    $user_info = CS50::query("SELECT cash FROM users WHERE id = ? ", $_SESSION["id"]); 
    
    $cash = number_format( $user_info[0]["cash"] , 2) ;

    $user_portfolio_rows = CS50::query("SELECT * FROM portfolios WHERE user_id = ? " ,  $_SESSION["id"]);

    $positions = [];
    foreach ($user_portfolio_rows as $row)
    {
        $stock = lookup($row["symbol"]);
        if ($stock !== false)
        {
            $positions[] = [
                "name" => $stock["name"],
                "price" => number_format( $stock["price"], 2), 
                "shares" => $row["shares"],
                "symbol" => $row["symbol"]
            ];
        }
    }

    // render portfolio
    render("portfolio.php", ["title" => "Portfolio", "positions" => $positions, "balance" => $cash]);

?>
