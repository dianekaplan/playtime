/**
 * recover.c
 *
 * Diane Kaplan
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
FILE* make_jpg(char*);
void append_jpg(char*, BYTE*);
void free(void *ptr);
char* get_name(int);  // total fantasy, since strncpy segfaulted for array->string (though fine array->array and string->array)


int main(int argc, char* argv[])
{
    // open up our raw data file
    FILE* inptr = fopen("card.raw", "r");
    if (inptr == NULL)
    {
        printf("Could not open card.raw.\n");
        return 2;
    }

    // declare stuff we'll need
    FILE* current_image;  
    char *open_jpg = malloc(7*sizeof(char) + 1);
    string image_name="";
    
    // Go 512 bytes at a time, and read it into a buffer
    for (int jpg_counter = 0; !feof(inptr); inptr+=512)
    {
        // Make buffer array, and read in 512 byte chunk
        BYTE buffer[512];
        fread(&buffer, 512, 1, inptr);
        
        // Get the appropriate image name that would be right 
        open_jpg = get_name(jpg_counter);  
        strncpy(image_name, open_jpg, 7);
        
        
        // See if this block begins with the jpg signature
        // If yes, it could be a new jpg or one in progress
        if (check_signature(buffer) == 1)
        {
            // if we have an image in progress, close it
            fclose(current_image);
            
            // make next jpg! (First increment image_counter, and get new name) 
            jpg_counter++;
            open_jpg = get_name(jpg_counter);  
            make_jpg(open_jpg);
        }
        // Otherwise, this chunk is still adding onto the jpg in progress
        else
        {
            // append to open jpg file
            append_jpg(open_jpg, buffer);
        }    
    }
    
    // close off that last jpg in progress
    fclose(current_image);

    // free malloc'd space
    free(open_jpg);
}


/**
 * Check the first 4 bytes of this chunk for match with jpg signature
 */
int check_signature(BYTE* ptr)
{
    BYTE valid_first3[3] = {0xff, 0xd8, 0xff};
    BYTE valid_fourth[17] = {0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef};
    
    // check first 4 bytes
    BYTE this_first3[3] = ptr[0:2]; // no clue how to do this
    BYTE this_fourth[1] = ptr[3];

    int match = 0;

    // if the first 3 match signature and 4th is in the valid set, jpg! 
    if (this_first3 == valid_first3) 
        {
            for (int i = 0; i < 17; i++)
                {
                    if (this_fourth == valid_fourth[i])
                    {
                        match = 1;
                    }
                }
        }
    if (match == 1);
        return 1; 
    else 
        return 0;
}
    
    
/**
 * get the suitable name for a jpg of that number 
 */
char* get_name(int);  
    
    
/**
 * make a new jpg with the name given
 */
FILE* make_jpg(char* name_ptr)
{
    string image_name="";
    strncpy(image_name, name_ptr, 7);
    // Also need some step to add leading 0's as need
    
    FILE* img = fopen(image_name, "w");
    
    if (img == NULL)
    {
        fprintf(stderr, "Could not create %s.\n", image_name);
    }
    else
    return img;
}

/**
 * append this chunk of bytes onto the image name given
 */
void append_jpg(char* name_ptr, BYTE* this_chunk)
{
    string image_name="";
    strncpy(image_name, name_ptr, 7);

    // append to the file that has that name
    FILE* img = fopen(image_name, "a");  
    
    if (img == NULL)
    {
        fprintf(stderr, "Could not open %s.\n", image_name);
    }
    else 
    {
        fwrite(this_chunk, 512, 1, img);
    }

}

            
