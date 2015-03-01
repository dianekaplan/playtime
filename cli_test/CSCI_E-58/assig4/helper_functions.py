# orfFinder.py        Starting point for Open Reading Frame Finder (ORF Finder)
#This program reads in a FASTA file and prints the ORF information for all 6 reading frames
# Diane Kaplan        February 2015
#
# Usage:
#     % python orfFinder.py <filename> [<minimal ORF length>]

#Assumptions & Limitations: I print from inside the print_ORFs function, and this program doesn't include overlapping ORFs
# Citations: This makes use of Jeff Parker's cs58FileUtil.py for reading file and doing cleanup

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare
import profile


DEBUG = False

def reverseComplement(sequence):
    seq= sequence
    seq_backward = seq[::-1] 
    base_partners = {"A":"T", "C":"G", "G":"C", "T":"A"} 
    seq_converted = ""  
    
    for char in seq_backward: #Loop through and look up the complement to create the new sequence
        seq_converted += base_partners[char]

    return seq_converted
 
def get_TATAA_info(seq):  #take a sequence and return info about TATAAT occurrences in the forward direction
    position_of_first= -1
    position_of_last= -1  
    TATAAT_count = -1  
    results = [] #this will have the first position of each instance encountered
 
    seqLen = len(seq)  
    cursor = 0

    #Let's make our list of instances
    while cursor < seqLen-5: 
        this_snippet = seq[cursor:cursor+6]

        #if it matches, save the spot and increment our count
        if this_snippet == 'TATAAT':
            results.append(cursor)
        cursor +=1    

    #use the list to populate the info we're looking for
    TATAAT_count = len(results)
    if TATAAT_count > 0: 
        position_of_first = results[0]
        position_of_last = results[TATAAT_count-1]
                      
    return (position_of_first,position_of_last,TATAAT_count)   
       

def find_ORFs (text, offset):  #this function returns a dictionary of ORF start and end locations (of any length)
    seq_length = len(text)
    start_codons=['ATG']
    stop_codons=['TAA', 'TAG', 'TGA']
    this_frame_ORFs = {}
    
    number_of_codons = (seq_length-offset)/3  #Ignore extra bases on the end
    codon_cursor = 0
    cursor = offset  #use offset to use correct reading frame
    in_ORF = False
    
    while codon_cursor < number_of_codons:
        this_codon = text[cursor:cursor+3]
        if in_ORF: #We're in an ORF, so look for stop codon
            if this_codon in stop_codons:
                this_frame_ORFs[this_start] = cursor + 3
                in_ORF = False
        if in_ORF ==False: #We're not in an ORF, so look for start codon
            if this_codon in start_codons:
                this_start =cursor + 1 #adding one to start from 1 not 0 for biologists
                this_frame_ORFs[this_start]=0 #initialize stop as 0: if it's not replaced, ORF spans past our sequence 
                in_ORF = True
        codon_cursor +=1    
        cursor += 3
    return this_frame_ORFs    

