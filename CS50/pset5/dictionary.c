/**
 * dictionary.c
 *
 * Computer Science 50
 * Problem Set 5
 *
 * Implements a spell checker.
 */

#include <stdbool.h>
#include <stdio.h>
#include <string.h> // for strcspn
#include <cs50.h>  // for strings
#include <ctype.h>  // for isalpha
#include "dictionary.h"


// Define the node struct that'll be used in our dictionary storage trie
typedef struct node	
{	
	bool is_word;
	struct node* children[27];
}	
node;	

// Make the root node pointer for that trie (global, for access elsewhere)
node* root_ptr;


// Define a different node struct to save linked list of node addresses (keep track, to free them faster)
typedef struct node_list_item
{	
	node* address;
	struct node_list_item* next;
}	
node_list_item;

// Make the root node pointer for the head of that list
node_list_item* node_list_ptr;


// Make an int counter for the number of words in the dictionary
int dictionary_count = 0;
int* dictionary_count_ptr = &dictionary_count; 

// Prototypes
void free_node(node*);
void record_node(node*);
void free_nodes_from_list(void);
void free_list_itself(void);


/**
 * Returns true if word is in dictionary, else false.
 */
bool check(const char* word)
{
    int length = strlen(word);
    char this_letter; 
    int this_index;

    // Make a node pointer to hold our place
    node* current_node; 
    
    // start it at our trie root
    current_node = root_ptr;
                
     // follow the word down, and when you get to the end, check is_word   
    for (int i = 0; i < length; i++)
    {
        // First, get the index for this character
        this_letter = tolower(word[i]);
    
        if (isalpha(this_letter))
            this_index = this_letter - 'a';
        else
            this_index = 26;
                
        // check that letter's index in this node
        // If it's NULL, return false
        if (current_node->children[this_index] == NULL)
        {
            return false;
        }
        // there's a pointer in there, move current_node to that address
        else  
        {   
            current_node = current_node->children[this_index];
        }
    }
    
    // If I got this far, I'm at the end of the word
    if (current_node->is_word)
        return true;
    else
        return false;
}

/**
 * Loads dictionary into memory.  Returns true if successful, else false.
 */
bool load(const char* dictionary)
{
    // open input file 
    FILE* inptr = fopen(dictionary, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", dictionary);
        return 2;
    }
    
    char this_word[46];
    char this_letter; 
    int this_index = 0, word_count = 0;
    
    // create our root node in memory, calloc initializes to NULL
    node* root = calloc(1, sizeof(node)); 
    
    // point that global pointer to it, for later
    root_ptr = root; 
    
    // Now we'll have a node pointer to hold our place
    node* current_node = root;	

    while(fgets(this_word, LENGTH + 1, inptr) != NULL)  
    {
        // Remove the newline, got this idea from comments here: 
        // http://stackoverflow.com/questions/2693776/removing-trailing-newline-character-from-fgets-input
        this_word[strcspn(this_word, "\n")] = 0;
        int word_len = strlen(this_word);

        // Letter by letter, first determine which index it maps to in array
        for (int i = 0; i < word_len; i++)
        {
            this_letter = this_word[i];
            
            // use 0-25 for letters, and 26 for '  
            if (isalpha(this_letter)) 
                this_index = this_letter - 'a';
            else
                this_index = 26;                
                            
            // If that index of current node's children array points somewhere, go there                
            if (current_node->children[this_index] != NULL)
            {
                // Follow the pointer and update current_node to the next one 
                current_node = current_node->children[this_index];
            }
            
            // If it doesn't, make new node, and set this index's pointer to it
            else
            {
                node* next = calloc(1, sizeof(struct node));  
                current_node->children[this_index] = next;
                
                // Record it in our list of nodes (for faster freeing later)
                record_node(next);
                
                // Then set current_node to this new one before going to next letter
                current_node = next;
            }
            
            // If we're at the end of a word, set is_word to true and word_count++
            if (word_len - i == 1)
            {
                current_node->is_word = true;
                word_count++;
            }
        }
        // This word is over- set current_node back to root for the next word
        current_node = root;
    }
    
    // Update our dictionary count pointer to this new total
    *dictionary_count_ptr = word_count; 

    fclose(inptr);
    return true;
}

/**
 * Returns number of words in dictionary if loaded else 0 if not yet loaded.
 */
unsigned int size(void)
{
    int count = *dictionary_count_ptr;

    return count;
}

/**
 * Unloads dictionary from memory.  Returns true if successful else false.
 */
bool unload(void)
{
    // Originally, I used recursive function free_node below
    // free_node(root_ptr);  
    
    // Then to go faster, I added these instead: 
    free_nodes_from_list();
    
    // free the original root
    free(root_ptr);
    
    // free up that list we used to record the addresses
    free_list_itself();
    return true;
}


/**
 * Adds a node into the linked list of node addresses. 
 */
void record_node(node* n)
{
    // make a node_list_item
    node_list_item* this_node = malloc(sizeof(node_list_item));
    
    // exit if that didn't work
    if (this_node == NULL)
    {
        exit(1);
    }
    
    // initialize the new node_list_item
    this_node->address = n;
    this_node->next = NULL;
    
    // insert it at the head of the linked list
    this_node->next = node_list_ptr; 
    node_list_ptr = this_node;
}

// Use our list of node addresses to free those nodes
void free_nodes_from_list(void)
{
    node_list_item* cursor = node_list_ptr;
    node* this_trie_node;
    
    while (cursor != NULL)
    {
        this_trie_node = cursor->address;
        cursor = cursor->next;

        if (this_trie_node != NULL)
        {
            free(this_trie_node);
        }
    }
}

// Finally, free up the space we malloc'd for the list itself
void free_list_itself(void)
{
    node_list_item* cursor = node_list_ptr;
    node_list_item* previous = node_list_ptr;
    
    while (cursor != NULL)
    {
        previous = cursor;
        cursor = cursor->next; 
        free(previous);
    }
}


// Original recursive function- works great, and somehow feels cleaner, but 
// no longer calling since the other way runs a smidge faster
/**
 * Unloads dictionary from memory.  Returns true if successful else false.
 * 
 *  BIG CITATION: I'd searched 'free memory trie' on stackoverflow and saw this: 
 * http://stackoverflow.com/questions/16661553/cant-free-memory-correctly
 * It's the same approach I was going, minus updating pointers to NULL along the way 
 */
void free_node(node* this_node)
{
    // if all elements in the node's children[] are empty, free the node 
    // otherwise, follow the pointer and call free_node on that child node
    for (int i=0; i < 27; i++)
    {
        if (this_node->children[i] != NULL)
        {
            free_node(this_node->children[i]);
            
         // I'd think it's best to set pointer back to NULL after freeing child,   
         // but Valgrind says all heap blocks are freed either way. Commenting 
         // out to trim off a step:
         // this_node->children[i] = NULL;  
        }
    }
    
    // If we've made it through all children (& offshoots), we've reached the 
    // end of that node's children array and ready to release it
    free(this_node);
}
