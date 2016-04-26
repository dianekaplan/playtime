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
#include <cs50.h>
#include <stdio.h> // used for sprintf
#include <string.h> // for strcpy
#include <stdint.h> // need for BYTE below


// prototypes
typedef uint8_t BYTE;
BYTE *find_first_jpg(BYTE*);
int check_signature(BYTE*);
FILE* make_jpg(int);
void append_jpg(int, BYTE*);
void free(void *ptr);

// Tried breaking this out, to do it once per image and pass pointer to char array name
// strncpy was fine array->array and string->array, but array->string would segfault
// char* [] make_name(int);  


int main(int argc, char* argv[])
{
    // open up our raw data file
    FILE* inptr = fopen("card.raw", "r");
    if (inptr == NULL)
    {
        printf("Could not open card.raw.\n");
        return 2;
    }
    
    BYTE buffer[512];

    fread(&buffer, 512, 1, inptr);
    
    FILE* outptr = fopen("recover_log.txt", "w");

    fprintf(outptr, "Buffer has: %i\n", *buffer);
    // // FILE* current_image;
    
    for (int i=0; i< 512; i++)
    {
        if (buffer[i] == 0xff)
            printf("we have a match!");
        
        printf("i: %d \n", buffer[i]);
        
    }

}
