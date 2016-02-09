/**
 * mario.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Prompt user for half-pyramids' height (non-negative, <= 23), then draw it
 * */

#include <cs50.h>
#include <stdio.h>

// prototypes
int GetHeight(void);
void PrintBlocks(int);


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
    
    // Output the height entered, and draw the two half pyramids
    else 
    {
        // printf("Height: %i\n", height); 
        
        for (int i = 1; i <= height; i++)
        {
            /**
            * Print the left half.  This one aligns the blocks to the right, 
            * so there'll be spaces to output before the 
            * number of blocks (in all but the bottom row).
            */
            int num_of_spaces = (height - i);
            
            // Print the leading spaces
            for (int space_count = 0; space_count < num_of_spaces; space_count++)
            {
                printf(" ");
            }
            
            // Print the blocks
            PrintBlocks(i);
            
            // Print the space between the two sections
            // I started with a for loop, office hours 
            // suggested it could be quicker, so I googled
            // for repeating a character
            printf("%*s", space_between_halves, " " );
            
            
            // Print the right half
            PrintBlocks(i);
            
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
    int height; 
    do
    {
        printf("Please enter non-negative int no greater than 23: \n");
        height = GetInt();
    }
    // don't take it until it satisfies the rules
    while ( (height < 0 ) || (height > 23));  
    return height;
}

/**
 * Print a row of blocks (broke this out since the program does it twice)
 */
void PrintBlocks(int width)
{
    for (int this_block = 0; this_block < width; this_block++)
    {
        printf("#");
    }
}
