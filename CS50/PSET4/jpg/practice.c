       
#include <stdio.h>
#include <stdlib.h>
#include <string.h> // for strcpy
#include <cs50.h>


// // prototypes
// void free(pointer to heap memory); 
void set_to_five(int*);
void log_stuff(int*);


int main(void)
{

    int* newptr = malloc(sizeof(int));
    
    *newptr = GetInt();
    
    if (newptr == NULL)
    {
          printf("Error - out of memory.\n");
          return 1;
    }
    
    // printf("newptr has: %i. \n", *newptr);
    log_stuff(newptr);
        
    set_to_five(newptr);
             
    // printf("Now newptr has: %i. \n", *newptr);
    log_stuff(newptr);
    
    char arraytest[] = {'a', 'b', 'c'};
    
    char *arraytest_ptr;
    arraytest_ptr = arraytest;

    
    char copied [4]; 
    
    strncpy(copied, arraytest, 3);
    
    char *open_jpg = malloc(7*sizeof(char) + 1);
    strncpy(open_jpg, arraytest, 3); // working from array to array
    
    string string_version = "cats are fun";
    strncpy(arraytest, string_version, 3);  // working from string to array 
    
    strncpy(string_version, arraytest, 1);  // but it segfaults when I do array to string
    
    printf("arraytest: %s \n", arraytest );
    printf("copied: %s \n", copied );
    printf("open_jpg: %s \n", open_jpg );
    printf("string_version: %s \n", string_version );
    // printf("arraytest_ptr shows: %c \n", *arraytest_ptr );  // segfault
    // printf("arraytest_ptr shows: %c \n", arraytest_ptr[0] );  // segfault

    // char *string_test = malloc(7*sizeof(char) + 1);
    
    // string_test = {
    // string string_version = 
    //  *string_test  = "Diane";  
            
        
    free(newptr);

}



void set_to_five(int* ptr)
{
    *ptr = 5;
}

void log_stuff(int* ptr)
{
    int numbers[4] = {1, 2, 3, 4};
    
    FILE* outptr = fopen("log.txt", "a");

    fprintf(outptr, "The thing saved at your pointer is: %i\n", *ptr);
    
        
    fprintf(outptr, "And here are some numbers:\n");
    if (outptr != NULL)
    {
        for (int i=0; i< 4 ; i++)
        {
            fprintf(outptr, "%i\n", numbers[i]);
        }
    }
    
    else
    {
        printf("Could not open log.txt.\n");
    }
    
    fclose(outptr);
    
}