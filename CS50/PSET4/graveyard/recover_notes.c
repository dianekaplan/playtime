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
// #include "bmp.h" // may need to give path for it
#include <stdint.h> // need for BYTE below


// prototypes
typedef uint8_t BYTE;
BYTE *find_first_jpg(BYTE*);
// int check_signature(BYTE* ptr);
int check_signature(BYTE*);
// void make_jpg(char*);
// void append_jpg(char*, BYTE*);
FILE* make_jpg(int);
void append_jpg(int, BYTE*);
// void free(void BYTE*);

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
    





    // Read all the contents
    
    // First, find the first signature
    // BYTE* beginning = find_first_jpg(inptr);
    // If we do go this route, we can read a number of bytes like this:
    // read(destination, &inptr, sizeof(BYTE));

    
    // Then, start sequence where we iterate through the blocks and do stuff
    
    // BYTE* cursor; 
    // FILE* cursor = inptr;
    // fread(cursor, 1, 1, inptr);
    // BYTE temp_file[] = {0xff, 0xd8, 0xff, 0xe8, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

    BYTE buffer[512];
    // BYTE ptr_buffer;
    // ptr_buffer = temp_file;
    fread(&buffer, 512, 1, inptr);
    
    FILE* outptr = fopen("recover_log.txt", "w");

    fprintf(outptr, "Buffer has: %i\n", *buffer);
    // // FILE* current_image;

    

        

        // (fread(ptr_buffer, 512, 1, inptr);
    // Go 512 bytes at a time and save it into a buffer
    // for (int jpg_counter = 0; !feof(inptr); inptr+=512)
    // {
            
    //     // BYTE buffer[512];
        
    //     printf("Jpg counter is: %i, Read 512 bytes\n", jpg_counter);
            
        // BYTE *ptr_buffer = &buffer; 
        // char *open_jpg = malloc(7*sizeof(char) + 1);
        
        // (fread(ptr_buffer, 512, 1, inptr);

        // BYTE temp_array_match[4] = {0xff, 0xd8, 0xff, 0xe8};
        // BYTE temp_array_middle[4] = {0xff, 0xff, 0xff, 0xff};
        
 //       BYTE *ptr_match, *ptr_middle, *ptr_temp;
        // ptr_match = temp_array_match;
        // ptr_middle = temp_array_middle;
    
        // // for now- try it with a match
        // ptr_temp= ptr_match;

        // if (check_signature(ptr_temp) == 1)
        // {
        //     printf("This matches signature\n");
        //     // if we already have one open, close it
            
        //     // make new jpg file
        //     current_image = make_jpg(jpg_counter);
        //     // make_jpg(*open_jpg);
            
        // }
        // else
        // {
        //     // append to open jpg file
        //     append_jpg(jpg_counter, ptr_temp);
        // }    
 //               

        // close files
        
        // close final jpg file
        fclose(inptr);
        
        // free malloc'd space
        // free(open_jpg);
        // free(point);
                    
    // }
}


/**
 * Check the first 4 bytes of this chunk for match with jpg signature
 */
int check_signature(BYTE* ptr)
{

    // BYTE valid_first3[3]= {0xff, 0xd8, 0xff};
    // BYTE valid_fourth[17]= {0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef};
    // // or may prefer to match first 4 bits to 1110
    
    // // check first 4 bytes
    // BYTE this_first3[3];
    // BYTE this_fourth[1];

    // if (these_first3 in valid_first3) && (this_fourth in valid_fourth)
        return 1; 
    // else 
    //     return 0;
    
}
    
/**
 * make a new jpg 
 */
// void make_jpg(char* name_ptr)
FILE* make_jpg(int img_number)
{
    string image_name= "";
    sprintf(image_name, "%d,jpg", img_number);
    FILE* img = fopen(image_name, "w");
    
    printf("Make jpg number %i: %s \n", img_number, image_name);
    
    // Make the jpg with that name
    FILE* outptr = fopen(image_name, "w"); // cross fingers
    if (outptr == NULL)
    {
        fprintf(stderr, "Could not create %s.\n", image_name);
    }
    else
    fclose(outptr);
    return img;
}

// void append_jpg(char* name_ptr, BYTE* this_chunk)
void append_jpg(int img_number, BYTE* this_chunk)
{
    string image_name= "";
    sprintf(image_name, "%d,jpg", img_number);
    
    printf("Append to jpg number: %i \n", img_number);

    // append to the file that has that name
    FILE* img = fopen(image_name, "a");  
    
    // FILE* img = fopen(*name_ptr, "a"); // cross fingers
    
    if (img == NULL)
    {
        fprintf(stderr, "Could not open %s.\n", image_name);
    }

    fclose(img);
        
        
    // // go from your buffer into the outfile
    // // can we append a little at a time this way?  
    // fwrite(&buffer, 512, number, outptr);

    //     FILE* outptr = fopen("log.txt", "a");
    //             FILE* img = fopen(jpg_name, "a");
        
}

            
