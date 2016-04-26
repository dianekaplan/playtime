/**
 * recover.c
 *
 * Diane Kaplan
 * 
 * Computer Science 50
 * Problem Set 4
 *
 * Recovers JPEGs from a forensic image.
 */

#include <stdio.h> // used for sprintf

// #include "bmp.h" // may need to give path for it

// prototypes
// int check_signature(BYTE* ptr);
int check_signature(BYTE*);
void make_jpg(string);

int main(int argc, char* argv[])
{
    // open up our raw data file
    FILE* inptr = fopen("card.raw", "r");
    if (inptr == NULL)
    {
        printf("Could not open card.raw.\n");
        return 2;
    }
    
    // Read all the contents
    
    
    
    // First, find the first signature
    BYTE* beginning = find_first_jpg(inptr);
    
    // Then, start sequence where we iterate through the blocks and do stuff
    

    // Go 512 bytes at a time and save it into a buffer
    for (BYTE* cursor = beginning, int jpg_counter = 0; !(feof(inptr)); cursor+=512;)
    {
            
        BYTE buffer[512];
        BYTE *ptr_buffer = &buffer; 
        
        (fread(ptr_buffer, 512, 1, inptr);

        if (check_signature(ptr) == 1)
        {
            // if we already have one open, close it
            // make new jpg file
        }
        else
        {
            // append to open jpg file
        }
        
        // close final jpg file
        fclose(inptr);
                    

        
        
        // 1. open a new jpg from i with the name reflecting number
        char jpg_name[7];
        sprintf(jpg_name,"%d.jpg", jpg_counter); // add leading 0s 
        printf("%s\n", buffer);
//     // On success, sprintf returns the total number of characters written to ptr. Otherwise, a negative number is returned.
    

        // 2. save the current block into the current jpg
        FILE* img = fopen(jpg_name, "a");
        // 3. at start of the next block, check for signature
                // if true:
                        // close that image 
                        // go back to the top
                // if false: save this next block into this jpg, go back to #2
                        
    }


fclose(fp);
    
    fread(&this_block, 512, number, inptr);
// https://reference.cs50.net/stdio.h/fread
// fread(&data, size, number, inptr);

// fread returns how many items of size size were read (ideally the one you gave, if different that may indicate a problem depending on usage)

// watch that again at 7:22
// if(fread(&buf, sizeof(DOG), 2, ptr) == 1)
// I'd like to read 2 dogs at a time, but if it returns one instead that means there aren't 2 dogs left (only one
//this could help us check for the end of the file)

// she said fgetc will also do this
    
    


// when you see it, call function to open a new jpg file and write chunks of 512 bytes, until there's another signature, then close the file
//detect the end of the file
// a jpeg may cover multiple blocks
// and it may finish early, leaving slack space- they will be 0's, fine to include in your outfile
// There will be 50 images on there

// number the files ###.jpg, where ### is the three-digit decimal number from 000 on up
// As before, if you happen to use malloc, be sure to use free so as not to leak memory. Try using valgrind to check for any leaks!

}


/**
 * Initializes the game's board with tiles numbered 1 through d*d - 1
 * (i.e., fills 2D array with values but does not actually print them).  
 */
BYTE *find_first_jpg(BYTE *arr)
{
    int *point = malloc(sizeof *point); /* Mandatory. */
    *point=12;  
    return point;
    
}



/**
 * Check the first 4 bytes of this chunk for match with jpg signature
 */
void check_signature(BYTE* ptr)
{

    BYTE valid_first3[3]= {0xff 0xd8 0xff};
    BYTE valid_fourth[17]= {0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef};
    // or may prefer to match first 4 bits to 1110
    
    // check first 4 bytes
    

    if (these_first3 in valid_first3) && (this_fourth in valid_fourth)
        return 1; 
    else 
        return 0;
    
}




    
/**
 * make a new jpg 
 */
void make_jpg(string name)
{

    char* outfile = argv[3];
    
            // outfile = '###.jpg'
            
            // go from your buffer into the outfile
            // can we append a little at a time this way?  
                fwrite(&this_block, 512, number, outptr);
                // or need to do it all at once
                fwrite(&big_super_block, [lengths of the blocks together], number, outptr);     
                
                // I think size can stay 512 and we specify what number of those blocks?
                
    FILE* outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {

        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
    }
    fclose(inptr);
    fclose(outptr);

}

