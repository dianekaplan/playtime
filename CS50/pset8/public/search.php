<?php

    require(__DIR__ . "/../includes/config.php");

    // numerically indexed array of places
    $places = [];
    $query =  $_GET["geo"];
    $query_array = $query;
    
    // First, split our geo info into pieces
    // got info here: http://stackoverflow.com/questions/24189698/how-to-use-preg-split-in-php
    // $query_array = preg_split("/[\s,]+/", $query, -1, PREG_SPLIT_NO_EMPTY);  // \s includes whitespace, great if all towns/states were 1 word but that's not the case
    $query_array = preg_split("/[,]+/", $query, NULL, PREG_SPLIT_NO_EMPTY);

    // explode(',', $query_array);
     
    $state_abbrev = NULL;
    $state_name = NULL;
    
    // If we have two pieces, treat the second one as the state
    if (count($query_array) > 1)
    {
        // print ("this argument is: " . $query_array[1] . " with length: " . strlen($query_array[1]) .  "\n");
        if (strlen($query_array[1]) == 2 )
        {
            $state_abbrev = $query_array[1];
            // print("setting state_abbrev \n");
        }
        else
        {
            $state_name = $query_array[1];   
            // print("setting state_name to: " . $query_array[1] . "\n");
        }
    }
    
    // print("After first step, state_abbrev: " . $state_abbrev . " and state_name: " . $state_name . "\n");
    
    // If out of order, we can spot the state abbreviation by length  
    foreach ($query_array as $piece)
    {
        // print($piece . "\n");
        // if a piece is two characters, that's likely state, aka admin_code1
        if ((strlen($piece) == 2 ) && $piece != 'US')
        {
            $state_abbrev = $piece;
        }
        
    }

    // print("After second step, state_abbrev: " . $state_abbrev . " and state_name: " . $state_name . "\n");
    
    
    // If the user gave us two pieces, I'd like to treat the second as a state (but counter example is two-word town name like New Haven)    
    // print("we have " . count($query_array) . " pieces \n");
    
    // print("state_abbrev: " . isset($state_abbrev) . " and state_name: " . isset($state_name) . "\n");
    
    $final_query = "SELECT * FROM places WHERE MATCH(postal_code, place_name) AGAINST (?)";
    
    if (isset($state_abbrev))
    {
        $final_query = $final_query . " AND admin_code1 = '" . $state_abbrev . "'";
    }
    
    if (isset($state_name))
    {
        $final_query = $final_query . " AND admin_name1 = '" . $state_name . "'";
    }
        

    // Run the query and store the results into $places
    $places = CS50::query($final_query, $query);
    

    // output places as JSON (pretty-printed for debugging convenience)
    header("Content-type: application/json");
        
    print(json_encode($places, JSON_PRETTY_PRINT));
    
?>