<?php

    // configuration
    require("../includes/config.php");
    
    // save user id locally since we'll use it a couple times
    $id = $_SESSION["id"];
    
    // get this user's transaction history
    $user_history = CS50::query("SELECT * FROM history WHERE user_id = ? " ,  $id);
    
    // $share_price = $user_history["share_price"];
    // $date_time = $user_history["datetime"];
    // dump($user_history);
    
    $formatted_transactions = [];
    foreach ($user_history as $transaction)
    {
        // convert date from a string to a real date, so we can format
        $date_string = $transaction["datetime"];
        $real_date = date_create($date_string);
        $formatted_date = date_format($real_date, 'd M Y, g:i a');
            
        {
            $formatted_transactions[] = [
                "user_id" => $transaction["user_id"],
                "symbol" => $transaction["symbol"],
                "shares" => $transaction["shares"],
                "share_price" => number_format( $transaction["share_price"], 2), 
                "transaction_type" => $transaction["transaction_type"],
                "datetime" => $formatted_date 
            ];
        }
    }

    //  render history form for our user
    render("history.php", ["history" => $formatted_transactions]);

?>