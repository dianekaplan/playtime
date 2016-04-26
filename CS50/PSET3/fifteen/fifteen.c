/**
 * fifteen.c
 *
 * Diane Kaplan
 * Computer Science 50
 * Problem Set 3
 *
 * Implements Game of Fifteen (generalized to d x d).
 *
 * Usage: fifteen d
 *
 * whereby the board's dimensions are to be d x d,
 * where d must be in [DIM_MIN,DIM_MAX]
 *
 * Note that usleep is obsolete, but it offers more granularity than
 * sleep and is simpler to use than nanosleep; `man usleep` for more.
 */
 
#define _XOPEN_SOURCE 500

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// constants
#define DIM_MIN 3
#define DIM_MAX 9

// board
int board[DIM_MAX][DIM_MAX];

// winning state (for comparison)
int winner_board[DIM_MAX][DIM_MAX];

// dimensions
int d;

// prototypes
void clear(void);
void greet(void);
void init(void);
void draw(void);
bool move(int tile);
bool won(void);
void printNum(int);
int * findLocation(int n);
void init_winner(void);


int main(int argc, string argv[])
{
    // ensure proper usage
    if (argc != 2)
    {
        printf("Usage: fifteen d\n");
        return 1;
    }

    // ensure valid dimensions
    d = atoi(argv[1]);
    if (d < DIM_MIN || d > DIM_MAX)
    {
        printf("Board must be between %i x %i and %i x %i, inclusive.\n",
            DIM_MIN, DIM_MIN, DIM_MAX, DIM_MAX);
        return 2;
    }

    // open log
    FILE* file = fopen("log.txt", "w");
    if (file == NULL)
    {
        return 3;
    }

    // greet user with instructions
    greet();

    // initialize the board
    init();
    
    // initialize winner_board for comparison
    init_winner();

    // accept moves until game is won
    while (true)
    {
        // clear the screen
        clear();  

        // draw the current state of the board
        printf("board is now: \n");
        draw();

        // log the current state of the board (for testing)
        for (int i = 0; i < d; i++)
        {
            for (int j = 0; j < d; j++)
            {
                fprintf(file, "%i", board[i][j]);
                if (j < d - 1)
                {
                    fprintf(file, "|");
                }
            }
            fprintf(file, "\n");
        }
        fflush(file);
        
        // check for win
        if (won())
        {
            printf("ftw!\n");
            break;
        }

        // prompt for move
        printf("Tile to move: ");
        int tile = GetInt();
        
        // quit if user inputs 0 (for testing)
        if (tile == 0)
        {
            break;
        }

        // log move (for testing)
        fprintf(file, "%i\n", tile);
        fflush(file);

        // move if possible, else report illegality
        if (!move(tile))
        {
            printf("\nIllegal move.\n");
            usleep(500000);
        }

        // sleep thread for animation's sake
        usleep(500000);
    }
    
    // close log
    fclose(file);

    // success
    return 0;
}

/**
 * Clears screen using ANSI escape sequences.
 */
void clear(void)
{
    printf("\033[2J");
    printf("\033[%d;%dH", 0, 0);
}

/**
 * Greets player.
 */
void greet(void)
{
    clear();
    printf("WELCOME TO GAME OF FIFTEEN\n");
    usleep(2000000);
}

/**
 * Initializes the game's board with tiles numbered 1 through d*d - 1
 * (i.e., fills 2D array with values but does not actually print them).  
 */
void init(void)
{
    int top_value = d * d - 1;

    for (int i = top_value, row = 0 ; row < d && i > 0; row++)
    {
        for (int col = 0; col < d; col++)
        {
            board[row][col] = i;
            i--;
        }
    }
    
    // Then if odd num of tiles (d is even), swap 1 and 2
    if (d % 2 == 0)
    {
        board[d - 1][d - 3] = 1;
        board[d - 1][d - 2] = 2;
    }
}

/**
 * Initializes the game's winning state (for comparison)
 */
void init_winner(void)
{
    // int top_value = d*d - 1;

    for (int i = 1, row = 0 ; row < d ; row++)
    {
        for (int col = 0; col < d; col++)
        {
            winner_board[row][col] = i;
            i++;
        }
    }
    
    // Then replace last space with the 0
    winner_board[d - 1][d - 1] = 0;
}

/**
 * Prints the board in its current state.
 */
void draw(void)
{
    for (int row = 0 ; row < d ; row++)
    {
        for (int col = 0; col < d; col++)
        {
            printNum(board[row][col]);
        }
        printf("\n");
    }
}

void printNum(int value)
{
    if ( value == 0)
        printf(" _ ");
    else if (value > 9)
        printf("%i ", value);
    else  // give single digits a leading space, for display alignment
        printf(" %i ", value);
}


/**
 * If tile borders empty space, moves tile and returns true, else
 * returns false. 
 */
bool move(int tile)
{
    // First check that the entry is a tile on the board
    int top_value = d * d - 1;
    if (tile > top_value || tile < 1)
    {
        printf("%i is not a valid selection\n", tile);
        return false;
    }
    
    // Then find where that element is
    // findLocation will return [row, column]
    static int * temp_tile_location;
    temp_tile_location = findLocation(tile);
    int tile_row = temp_tile_location[0];
    int tile_col = temp_tile_location[1];
    
    static int * temp_free_location;
    temp_free_location = findLocation(0);
    int free_row = temp_free_location[0];
    int free_col = temp_free_location[1];
            
    // Valid if they're in the same row and beside each other
    if ( (tile_row == free_row) && (abs(tile_col - free_col) == 1) )
    {
            // make the move
        board[free_row][free_col] = board[tile_row][tile_col]; 
        board[tile_row][tile_col] = 0; 
        return true;
    }
    
    // Valid if they're in the same column and over each other
    else if ( (tile_col == free_col) && ( abs(tile_row - free_row) == 1) )
    {
        // //make the move
        board[free_row][free_col] = board[tile_row][tile_col]; 
        board[tile_row][tile_col] = 0; 
        return true;
    }
    // I don't like repeating those 3 lines that make the move and return true, 
    // but it would be a super-long if statement to combine them
    // and abstracting a 'make the move' function seems like overkill
    else
    {
        return false;
    }

}

/**
 * For an array and a specific value, return the location of that value
 */
int * findLocation(int needle)
{
    // go through the board and find the location of this value
    int row = 3;
    int column = 4;
    
    for (int this_row = 0 ; this_row < d ; this_row++)
    {
        for (int this_col = 0; this_col < d; this_col++)
        {
            if (board[this_row][this_col] == needle)
            {
                row = this_row;
                column = this_col;
            }
        }
    }

    // Got idea to make it static here: 
    // http://stackoverflow.com/questions/18041100/using-c-string-address-of-stack-memory-associated-with-local-variable-retur
    static int location [2];
    location[0] = row;
    location[1] = column;

    return location;
}

/**
 * Returns true if game is won (i.e., board is in winning configuration), 
 * else false.
 */
bool won(void)
{
    // Compare our board[] with winner_board[]
    // Exit as soon as a value doesn't match 
    // If we get all the way through, the player won!
    int has_mismatch = 0;
    for (int row = 0 ; row < d ; row++)
    {
        for (int col = 0; col < d; col++)
        {
            if (winner_board[row][col] != board[row][col]) 
            {
                has_mismatch = 1;
                return false;
            }
        }
    }
    
    // If we made it through with no mismatches, the board matched!
    if (has_mismatch == 0)
        return true;
    else
        return false;
}