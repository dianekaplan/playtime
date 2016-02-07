/**
 * water.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Prompt the user for the length of their shower (in minutes), 
 * and return the equivalent number of water bottles they've used
 * 
 * */

#include <cs50.h>
#include <stdio.h>

// prototypes
int ConvertToBottles(int shower_min);
int GetShowerLength();

// values for shower flow and bottle size
int shower_ounces_per_minute = 192;
int ounces_per_bottle = 16;


int main(void)
{
    int shower_min, bottle_count;
    
    // get shower length from the user
    shower_min = GetShowerLength();
    
    // convert this to bottles and report the answer
    bottle_count = ConvertToBottles(shower_min);
    printf("A %i minute shower uses %i bottles of water \n", shower_min, bottle_count);
}


/**
 * Get shower length from the user
 */
int GetShowerLength()
{
    int shower_length; 
    do
    {
        printf("How many minutes was your shower: ");
        shower_length = GetInt();
    }
    while ( shower_length < 1 );  //don't take it unless the integer is non-negative
    return shower_length;
}



/**
 * Convert length of shower in minutes to bottles of water used
 */
int ConvertToBottles(int shower_min)
{
    int converted_bottle_count = (shower_min * shower_ounces_per_minute)/ounces_per_bottle;
    return converted_bottle_count;
}