<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET, we have the symbol we want
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("quote_form.php");
    }

    // else if user reached page via POST, get the info for the symbol
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // lookup the value the user requested
        $stock_info = lookup($_POST["symbol"]);
        
        if ($stock_info)
        {
            $name = $stock_info['name'];
            $price = number_format( $stock_info['price'] , 2) ;
            
            // Render the view with the values we have
            render("quote_result.php", ["symbol" => $_POST["symbol"], "name" => $name, "price" => $price]);
        }
        else
        {
            apologize("Symbol not found");
        }
        
    }
    
?>