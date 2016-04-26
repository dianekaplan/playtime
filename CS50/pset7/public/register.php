<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("register_form.php", ["title" => "Register"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {

        // Check the POST info, and prompt user if there are mistakes 
        if ( (($_POST["username"]) == null || ($_POST["password"]) == null )  )
            print("Please enter your desired username and password");
        if (  ($_POST["password"]) != ($_POST["confirmation"]) )
            print("Please check your password values- they don't match");
            
        // If no mistakes, create new user and log them in
        else
            {
                
            // try to create a new user in the database: 
            $create_attempt = CS50::query("INSERT IGNORE INTO users (username, hash, cash) VALUES(?, ?, 10000.0000)", $_POST["username"], password_hash($_POST["password"], PASSWORD_DEFAULT));
            if ($create_attempt)
            {
                // Find the new user id
                $rows = CS50::query("SELECT LAST_INSERT_ID() AS id");
                $id = $rows[0]["id"];
                     
                // Save it to the session (this logs them in)
                $_SESSION["id"] = $id;
                
                // Send them along to home page
                redirect("/");
            }
            
            // If save attempt didn't work, they likely chose an existing username
            else
                print("An account exists already for this user, please choose another.");
            }
    }
    
?>