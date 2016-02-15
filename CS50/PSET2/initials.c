/**
 * initials.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Prompt user for their name, then output their uppercase initials
 * */

#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h> // use this for toupper

// prototypes
string GetName(void);
void PrintInitials(string, char);


int main(void)
{
    // Prompt the user for their name
    string name = GetName();

    // Set our delimiter
    char delim = ' ';

    PrintInitials(name, delim);

    return 0;
}

/**
 * Get the user's name
 */
string GetName()
{
    string name; 
    do
    {
        // printf("Please type your name: \n");
        name = GetString();
    }
    // don't take it until it satisfies the rules
    while (strlen(name) < 1 );  
    return name;
}


/**
 * Take a string and print capitalized initials
 */
void PrintInitials(string name, char delim)
{
    
    int length = strlen(name);
    int num_of_spaces = 0;
    int initials_count = 0;
    
    // The most spaces we could have are every other character
    // How can I do this better?
    int pos_of_spaces[length / 2];
        
    // Go through the string they entered and find the spaces
    for (int i = 0; i < length; i++)
    {
        if (name[i] == delim)
        {
            num_of_spaces++;  
            pos_of_spaces[num_of_spaces - 1] = i;  // subtract 1 to count from 0
        }
    }

    // Now let's make the array of initials
    char initials[num_of_spaces + 1];
        
    // Make one for the first character 
    // Use toupper for capitalization
    initials[0] = toupper(name[0]);
    initials_count++;
    
    // Use the pos_of_spaces to add subsequent initials at index + i
    // The next initial is found +1 from the next space
    for (int i = 0; i < num_of_spaces; i++)
    {
        initials[i + 1] = toupper( name[pos_of_spaces[i] + 1] ); 
        initials_count++;
    }

    // Need to avoid printing that last buffer bit,
    // found syntax for putting part of it: 
    // http://stackoverflow.com/questions/5189071/print-part-of-char-array  
    printf("%.*s\n",  initials_count, initials);
    
}

