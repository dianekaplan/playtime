# findPalindrome.py        
#This program takes the name of an input file on the command line, and finds the longest palindrome in the text
# Diane Kaplan        February 2015
#
# Usage:
#     % python findPalindrome.py <filename>

#Assumptions & Limitations: 
# Citations: This makes use of Jeff Parker's cs58FileUtil.py for reading file and doing cleanup

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare, readFastaFile

# We can override this value with a Command Line Parameter
limit = 300  # How many base pairs long must an ORF be? We can override this value with a Command Line Parameter
snippet_length= 45 #How many bp to print for each (assumed to be less than limit, otherwise we'll go out of bounds)
DEBUG = False

def reverseComplement(sequence):
    seq= sequence
    seq_backward = seq[::-1] 
    base_partners = {"A":"T", "C":"G", "G":"C", "T":"A"} 
    seq_converted = ""  
    
    for char in seq_backward: #Loop through and look up the complement to create the new sequence
        seq_converted += base_partners[char]

    return seq_converted
    
def find_longest_palindrome (text):
    seq = text
    seq_length = len(seq)
    
    cursor = 0  
    best_so_far = 0
    length_to_try = 2 #we'll start looking for palindrome length 2 and increment 2 because it seems like it'll need to be even
    found_longest = False
    
    while found_longest == False: #we'll try each length until we don't get a hit
        while cursor < seq_length-length_to_try+1:

            this_snippet = seq[cursor:cursor+length_to_try]
            reverse = reverseComplement(this_snippet)
            if this_snippet == reverse:  #if we get a palindrome, try the next length
                this_start = cursor + 1
                best_so_far = [this_snippet, this_start]
                length_to_try +=2
                cursor = 0
            else:         #if not, continue to the end of the sequence to see if there is one
                cursor += 1    
        found_longest=True  #If we make it down this far, we've reached the end of the sequence for a length that doesn't have any hits

    return best_so_far 

                    


if ((len(sys.argv) < 2) or (len(sys.argv) > 3)):
    print "Usage: python", sys.argv[0], "<filename>"
else:
    fileName = sys.argv[1]
    if (len(sys.argv) > 2):             # This should be an integer
        try:
            limit = int(sys.argv[2])    # Convert string to integer
        except ValueError:              # try-except catches errors
            print "\n\tExpecting an integer to define min ORF length, found",
            print sys.argv[2]
            exit()

    
    
    
    text = readFastaFile(fileName) #remove 'cs58FileUtil" because it was giving a not defined error
    print find_longest_palindrome (text)
