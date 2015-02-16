# findPalindrome.py        
# This program takes the name of an input file on the command line, and finds the longest palindrome in the text (with starting position)
# Diane Kaplan        February 2015
#
# Usage:
#     % python findPalindrome.py <filename>

# Assumptions & Limitations: incoming file is a fasta file. (If header is removed it still finds best palindrome, but position is off)
# Citations: This uses Jeff Parker's cs58FileUtil.py for reading & preparing file, and grabbing filename from the command line

import string
import sys
from cs58FileUtil import prepare, readFastaFile
#import cs58FileUtil  #doing the whole thing didn't work; readFastaFile was considered undefined
import profile

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
    length_to_try = 2 #we'll start looking for palindrome length 2 and increment 2 (these will be even)
    found_longest = False
    
    while found_longest == False: #we'll try each length until we don't get a hit
        while cursor < seq_length-length_to_try+1:

            this_snippet = seq[cursor:cursor+length_to_try]
            reverse = reverseComplement(this_snippet)
            if this_snippet == reverse:  #if we get a palindrome, save it and move on to checking the next length
                this_start = cursor + 1
                best_so_far = [this_snippet, this_start]
                length_to_try +=2
                cursor = 0
            else:         #if not a palindrome, keep checking snippets of this length
                cursor += 1    
        found_longest=True  #If we make it here, no palindromes for that length so we're done

    return best_so_far 

                
if ((len(sys.argv) < 2) or (len(sys.argv) > 3)):
    print "Usage: python", sys.argv[0], "<filename>"
else:
    fileName = sys.argv[1]
    if (len(sys.argv) > 2):             # This should be an integer
        try:
            limit = int(sys.argv[2])    # Convert string to integer
        except ValueError:              # try-except catches errors
            print sys.argv[2]
            exit()       
            
    
    text = readFastaFile(fileName) #remove 'cs58FileUtil" because it was giving a not defined error
    text = prepare(text)
    print find_longest_palindrome (text)
    
profile.run("find_longest_palindrome(text)")