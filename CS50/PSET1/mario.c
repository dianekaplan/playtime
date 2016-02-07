/**
 * mario.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Prompt the user for half-pyramids' height (non-negative, no greater than 23), then draw it!
 * */

#include <cs50.h>
#include <stdio.h>

// prototypes
int GetHeight(void);
void PrintBlockRow(int);


int main(void)
{
    // Prompt the user for height value
    int height = GetHeight();
    int space_between_halves = 2;
    
    if (height < 1) 
    {
            // nothing to draw
            exit(0);
    }
    
    else // Output the height entered, and draw the two half pyramids
    {
        printf("Height: %i\n", height); 
        
        for (int i = 1; i <= height; i++)
        {
            /**
            * Print the left half.  This one aligns the blocks to the right, so there'll
            *  be spaces to output before the number of blocks (in all but the bottom row).
            */
            int number_of_spaces = (height - i);
            
            // Print the leading spaces
            for (int space_count = 0; space_count < number_of_spaces; space_count++)
            {
                printf(" ");
            }
            
            // Print the blocks
            PrintBlockRow(i);
            
            // Print the space between the two sections
            for (int this_space = 0; this_space < space_between_halves; this_space++)
            {
                printf(" ");
            }
            
            // Print the right half
            PrintBlockRow(i);
            
            // Row is complete, onto the next line!
            printf("\n");
        }
    }
    
    return 0;
}

/**
 * Get the pyramid height from the user
 */
int GetHeight()
{
    int collected_height; 
    do
    {
        printf("Please enter non-negative int no greater than 23: \n");
        collected_height = GetInt();
    }
    while ( (collected_height < 0 ) || (collected_height > 23));  //don't take it until it satisfies the rules
    return collected_height;
}

/**
 * Print a row of blocks (broke this out since the program does it twice)
 */
void PrintBlockRow(int width)
{
    for (int this_block = 0; this_block < width; this_block++)
        {
            printf("#");
        }
}
