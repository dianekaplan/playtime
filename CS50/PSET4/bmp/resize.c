/**
 * resize.c
 *
 * Diane Kaplan
 * Computer Science 50
 * Problem Set 4
 *
 * Resizes a 24-bit uncompressed BMP by a factor of n. 
 * 
 */
       
#include <stdio.h>
#include <stdlib.h>

#include "bmp.h"

int main(int argc, char* argv[])
{
    // ensure proper usage
    if (argc != 4)
    {
        printf("Usage: ./resize n infile outfile\n");
        
        return 1;
    }
    
    int resize_amt = 0;
    // n must be a positive integer less than or equal to 100
    
    if (argv[1] != NULL)
    {
        resize_amt = atoi (argv[1]);
    }
    
    if ((resize_amt < 1) || (resize_amt > 100))
    {
        printf("One integer command line argument, please\n");
        return 1;
    }

    // remember filenames
    char* infile = argv[2];
    char* outfile = argv[3];

    // open input file 
    FILE* inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

    // open output file
    FILE* outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
    }

    // read infile's BITMAPFILEHEADER
    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

    // read infile's BITMAPINFOHEADER
    BITMAPINFOHEADER bi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);

    // ensure infile is (likely) a 24-bit uncompressed BMP 4.0
    if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 || 
        bi.biBitCount != 24 || bi.biCompression != 0)
    {
        fclose(outptr);
        fclose(inptr);
        fprintf(stderr, "Unsupported file format.\n");
        return 4;
    }

    // Make headers for the resized copy, starting with original values
    // read infile's BITMAPFILEHEADER
    BITMAPFILEHEADER bf_resized;
    fread(&bf_resized, sizeof(BITMAPFILEHEADER), 1, inptr);

    // read infile's BITMAPINFOHEADER
    BITMAPINFOHEADER bi_resized;
    fread(&bi_resized, sizeof(BITMAPINFOHEADER), 1, inptr);
    
    // Then update affected fields for resizing
    bi_resized.biWidth = (bi.biWidth * resize_amt);  
    bi_resized.biHeight = (bi.biHeight * resize_amt);  

    // determine padding amount for old and new versions
    int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;  
    int padding_resized =  (4 - (bi_resized.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;  
    
    // The biSizeImage will be the bytes in each row x # of rows (which is height)
    // = (bytes of pixels + bytes of padding)        x height
    // = (width * 3 bytes each) + padding            x height  
    bi_resized.biSizeImage = ((bi_resized.biWidth * 3) + padding_resized) * abs(bi_resized.biHeight);  
    
    // Then bfSize is the whole thing: biSizeImage plus the headers (54)
    bf_resized.bfSize = (bi_resized.biSizeImage + 54);  
    
    // write outfile's BITMAPFILEHEADER
    fwrite(&bf_resized, sizeof(BITMAPFILEHEADER), 1, outptr); 

    // write outfile's BITMAPINFOHEADER
    fwrite(&bi_resized, sizeof(BITMAPINFOHEADER), 1, outptr);   


    /**
    * Approach: 
    * The original image has height x width pixels (plus padding we don't want)
    * From the infile, read & save the image pixels into RGBTRIPLE array: "image_meat" 
    * Then we use image_meat to write out one row of the resized file, inserting padding
    * Repeat that row the desired # of times (resize_amt)
    * Do that for each of the original rows (height)
    */

// (Break out into separate function when ready)
// The amount of original image_meat is # of image pixels (Height * Width)
// Make RGBTRIPLE array to hold this many pixels


    int image_meat_triples = (abs(bi.biHeight) * bi.biWidth);
    RGBTRIPLE image_meat[image_meat_triples];
    
    int save_cursor = 0;
        
    // iterate over infile's scanlines
    for (int i = 0, biHeight = abs(bi.biHeight); i < biHeight; i++)
    {
        // iterate over pixels in scanline
        for (int j = 0; j < bi.biWidth; j++)
        {
            // temporary storage
            RGBTRIPLE triple;

            // read RGB triple from infile
            fread(&triple, sizeof(RGBTRIPLE), 1, inptr);

            // write RGB triple into our image_meat array
            image_meat[save_cursor] = triple;
            
            save_cursor++; 
        }
        // if the original file has padding at the end of the row, skip over
        fseek(inptr, padding, SEEK_CUR);
    }

// (Break out into separate function when ready)
// Next, we'll use image_meat to write out to the resized file
    int meat_curser = 0;
    
    
    // The image_meat is from the original file (reflecting original rows)
    // Use values from original 'row' chunks, repeat each, then repeat row
    // Loop through image_meat, with # of original rows (bi.biHeight)
    

    // THINK ABOUT REMOVING THE SECOND CONDITIONAL
    // for (int i = 0, biHeight = abs(bi.biHeight); i < biHeight && meat_curser < triple_count; i++)
    for (int i = 0, biHeight = abs(bi.biHeight); i < biHeight; i++)
    {
        // Each time through we'll iterate the orignal width,
        // but save a resized row with repeats, making it longer (new width)
        RGBTRIPLE resized_row[bi_resized.biWidth];
        int row_cursor = 0;    
            
        for (int j = 0; j < (bi.biWidth); j++)
        {
            // temporary storage
            RGBTRIPLE triple;

            // read RGB triple from image_meat
            triple = image_meat[meat_curser];
            
            // write the RGB triple resize_amt times into resized_row array
            for (int rep = 0; rep < resize_amt; rep++)
            {
                resized_row[row_cursor] = triple;
                row_cursor++;
            }
            
            // Now you have written a (new) row's worth of image bytes
            // write the row, then write the padding, then repeat the row
            for (int x = 0; x < resize_amt; x++)
            {
                fwrite(&resized_row, sizeof(resized_row), 1, outptr);  
            
                // Write the row's padding
                for (int k = 0; k < padding_resized; k++)
                {
                    fputc(0x00, outptr);
                }
            }
            
            // It would feel cleaner to add the padding to resized_row
            // and repeat that, but the padding sometimes won't be a triple
            // that would let us do this:  
            // fwrite(&resized_row, sizeof(resized_row), resize_amt, outptr);  
        }
    }

    printf("Original BITMAPFILEHEADER: bfSize: %i, BITMAPINFOHEADER: biSize: %i, biWidth: %i, biHeight: %i, biSizeImage: %i, padding: %i \n", bf.bfSize, bi.biSize, bi.biWidth, bi.biHeight, bi.biSizeImage, padding   );
    // printf("image_meat_triples is: %i, sizeof(image_meat) is: %lu \n", image_meat_triples, sizeof(image_meat));
    printf("Resized BITMAPFILEHEADER: bfSize: %i, BITMAPINFOHEADER: biSize: %i, biWidth: %i, biHeight: %i, biSizeImage: %i, padding: %i \n", bf_resized.bfSize, bi_resized.biSize, bi_resized.biWidth, bi_resized.biHeight, bi_resized.biSizeImage, padding_resized );


    // for (int i = 0; i < image_meat_triples; i++)
    // {
    //     printf("pixel: %02hhX %02hhX %02hhX \n", image_meat[i].rgbtBlue, image_meat[i].rgbtGreen, image_meat[i].rgbtRed);    
    // }

    

    // close infile
    fclose(inptr);

    // close outfile
    fclose(outptr);

    // that's all folks
    return 0;
}
