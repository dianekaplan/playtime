/**
 * caesar.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Encrypt messages using caesar's cipher
 * */

#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h> // use this for isupper and islower
#include <stdlib.h> // use this for atoi (converting string to int)

// prototypes
string GetMessage(void);
int CaesarEncrypt(string, int);
int FixOffset(int);

int main(int argc, string argv[])
{
    int got_digit = 0;
     
    if (argv[1] != NULL)
    {
        got_digit = atoi (argv[1]);
    } 
            
    // Quit if user enters less or more than 1 command line argument
    if (argc != 2 || got_digit == 0 )
    {
        printf("One integer command line argument, please\n");
        return 1;
    }
    
    else
    {
        // set key from command line argument
        int key = atoi (argv[1]);
            
        // Prompt the user for a message, then encrypt it
        string message = GetMessage();
        CaesarEncrypt(message, key);
        
        // I wanted to return the string to main and print it from there, but
        // it gets mangled- reading up, passing arrays in C is problematic
    
        return 0;
    }
}

/**
 * Collect from user: message to encrypt
 */
string GetMessage(void)
{
    string message; 
    do
    {
        // printf("Type the message you'd like to encrypt: \n");
        message = GetString();
    }
    // don't take it until we have at least a character
    while (strlen(message) < 1 );  
    return message;
}

/**
 * Replace our offset with an equivalent value that plays nicely
 */
int FixOffset(int offset)
{
    // Bring it smaller if it's > 26 
    offset = offset % 26;
    
    // If negative, convert it to positive equivalent
    if (offset < 0) 
    {
        offset = (26 + offset);
    }
    return offset;
}

/**
 * Take a string and encrypt it 
 */
int CaesarEncrypt(string original, int key)
{
    int offset = FixOffset(key); 
    int length = strlen(original);
    char encrypted_array [length + 1]; // include extra bit for buffer
    
    for (int i = 0; i < length; i++)
    {
        // From tutorial, using int instead of char lets us use it both ways
        int this_char = original[i];
        int encrypted_char;
  
        // if we're near a top boundary, subtract instead
        if ( (isupper(this_char) && (this_char + offset > 90 )) || (islower(this_char) && (this_char + offset > 122 )) )
        {
            encrypted_char = this_char - (26 - offset); 
        }
            
        // otherwise just add the offset amount    
        else 
        {
            encrypted_char = this_char + offset; 
        }

        // Only encrypt alphabetical characters
        if ( isalpha( this_char ) ) 
        {
            encrypted_array[i] = encrypted_char;
        }
        else 
        {
            encrypted_array[i] = this_char;
        }
    }
    
    // Need to avoid printing that last buffer bit,
    // found syntax for putting part of it: 
    // http://stackoverflow.com/questions/5189071/print-part-of-char-array  
    printf("%.*s\n",  length, encrypted_array);

    return 0;
}


