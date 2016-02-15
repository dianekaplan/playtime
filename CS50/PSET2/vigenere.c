/**
 * vigenere.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Encrypt messages using Vigenere's cipher
 * */

#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h> // use this for isupper and islower
#include <stdlib.h> // use this for atoi (converting string to int)

// prototypes
string GetMessage(void);
void VigEncrypt(string, string);


int main(int argc, string argv[])
{
    int digit_count = 0;
    string keyword = "";
    
    if (argv[1] != NULL)
    {
        keyword = argv[1];
    }
    
    int length = strlen(keyword);
     
     // if we have a keyword, check for any digits
    if (argv[1] != NULL) 
    {
        for (int i = 0; i < length; i++)
        {
            digit_count += isdigit( keyword[i] );
        } 
    }       
 
    // Quit if user enters less or more than 1 command line argument
    if (argc != 2 || (digit_count > 0 ))
    {
        printf("One (plaintext string) command line argument, please\n");
        return 1;
    }
    
    else
    {
        // set key from command line argument
        // string keyword = argv[1];
            
        // Prompt the user for a message, then encrypt it
        string message = GetMessage();
        VigEncrypt(message, keyword);
        
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
 * Take a string and encrypt it 
 */
void VigEncrypt(string original, string keyword)
{
    int keyword_length = strlen(keyword);
    int message_length = strlen(original);
    char encrypted_array [message_length + 1]; // include extra bit for buffer
    
    int this_offset = 0;
    int this_char;
    int encrypted_char;
    int position; 
    
    for (int i = 0, j = 0; i < message_length; i++)
    {
        // From tutorial, using int instead of char lets us use it both ways
        this_char = original[i];
        position = j % keyword_length; // j will keep going up, so use modulus
        this_offset = keyword[position]; 
        
        // lowercase: a = 0 (not 97)
        if (islower(this_offset))
        {
            this_offset = this_offset - 97;
        }
        
           // uppercase: A = 0 (not 65)
        if (isupper(this_offset))
        {
            this_offset = this_offset - 65;
        }     
        
        
        // if we're near a top boundary, subtract instead
        if ( (isupper(this_char) && (this_char + this_offset > 90 )) || (islower(this_char) && (this_char + this_offset > 122 )) )
        {
            encrypted_char = this_char - (26 - this_offset); 
        }
        
        // otherwise just add the offset amount  
        else 
        {
            encrypted_char = (this_char + this_offset); 
        }

        // Only encrypt alphabetical characters
        if ( isalpha( this_char ) ) 
        {
            encrypted_array[i] = encrypted_char;
            j++;
        }
        else 
        {
            encrypted_array[i] = this_char;
        }
                
    }
    // Need to avoid printing that last buffer bit,
    // found syntax for putting part of it: 
    // http://stackoverflow.com/questions/5189071/print-part-of-char-array  
    
    printf("%.*s\n",  message_length, encrypted_array);
}
