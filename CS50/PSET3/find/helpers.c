/**
 * helpers.c
 *
 * Diane Kaplan
 * Computer Science 50
 * Problem Set 3
 *
 * Helper functions for Problem Set 3.
 */
       
#include <cs50.h>
#include <stdio.h>  // include this for printf

#include "helpers.h"


/**
 * Returns true if value is in array of n values, else false.
 */
bool search(int value, int values[], int n)
{
    // Return false immediately if n isn't positive (0 is okay)
    if (n < 0)
    {
        return false;
    }
    
    int needle = value; 
    int found_needle = 0;

    // Do binary search to check for specified value
    int start_boundary = 0;
    int stop_boundary = n - 1; 
    int viable_range_size = (stop_boundary - start_boundary) + 1; // +1 because inclusive
    int middle_index;

    while (found_needle == 0 && (viable_range_size > 0))
    {
        middle_index = (start_boundary + (viable_range_size / 2) );
            
        // Evaluate our middle with the value we're looking for    
        if (values[middle_index] == needle)
        {
            found_needle = 1;  // If you find it, you're all done
            return true;
        }
        
        // If middle value is too high, set upper bound just before it
        else if (values[middle_index] > needle)
        {
            // stop_boundary = middle_index; 
            stop_boundary = middle_index - 1; 
        }
        
        // If  middle value is too low, set lower bound just after it
        else if (values[middle_index] < needle)
        {
            // start_boundary = middle_index; 
            start_boundary = middle_index + 1; 
        }

        // Update the size of current viable range based on action above
        viable_range_size = (stop_boundary - start_boundary) + 1;
    }
	
    
    if (found_needle == 1)
        return true;
    else
        return false;
}

/**
 * Sorts array of n values, using selection sort
 */
void sort(int values[], int n)
{
    int size = n;
    int min_value, min_location;
    
    // i is always the first in the unsorted list, and the place we'll swap
    for (int i = 0 ; i < size; i++)
    {
        // Initialize these to the first unsorted value
        min_value = values[i];
        min_location = i;

        // Check remaining unsorted bunch for the lowest value
        for (int j = i + 1; j < size; j++)
        {
        // If a new one wins, update our variables 
            if (values[j] < min_value)
            {
                min_value = values[j];
                min_location = j;
            }
        }
        
        // Take that lowest value we found, and swap it into that spot in line 
        if (i != min_location)  // (skip if min was already in the first spot)
        {
            values[min_location] = values[i];
            values[i] = min_value;
        }
    }
    return;
}



