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
import cs58FileUtil

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
    

def find_ORFs (text, offset):
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


def print_ORFs(frame, ORF_dict, min_ORF_length, sequence):
    is_antisense= False 
    if frame[0] == '-': #know what direction we're printing for; if antisense, position should offset from the end
        is_antisense= True
        seq_length= len(sequence) # will need to know the overall sequence length in this case to show position from the end
        
    count = len(ORF_dict)
    if count ==0: 
        print "There were no ORFs in this sequence."
    else: 
        for ORF in ORF_dict: 
            length = ORF_dict[ORF] + 1 - ORF #we want the length in bases, so just like slicing we need to go one past the end
            
            if length >= min_ORF_length:
                if is_antisense: 
                    print frame, "Start", seq_length-ORF_dict[ORF]+1, "End", seq_length-ORF+1,"Len" ,length, "Seq", sequence[ORF-1:ORF-1 + snippet_length] 
                else: 
                    print frame, "Start", ORF, "End", ORF_dict[ORF],"Len" ,length, "Seq", sequence[ORF-1:ORF-1 + snippet_length] 
                
            if (DEBUG):
                if length > 0:
                    print "(An ORF below size limit starts at position",ORF, "and ends at", ORF_dict[ORF],": length:" ,length , "bases)."
                else: 
                    print "(There was also a start codon at position", ORF, "without a stop codon before the end of this sequence, we may want to look further out)."          
    return True
                    
def process_all_reading_frames(text, min_ORF_length):  
    seq = prepare(text)    # clean up our sequence
    antisense = reverseComplement(seq) #get the reverse complement 

    #get results for each reading frame, using offset to start cursor in the right place)
    frame_1_ORFs= find_ORFs(seq, 0) 
    frame_2_ORFs= find_ORFs(seq, 1) 
    frame_3_ORFs= find_ORFs(seq, 2) 
    
    frame_a1_ORFs= find_ORFs(antisense, 0) 
    frame_a2_ORFs= find_ORFs(antisense, 1) 
    frame_a3_ORFs= find_ORFs(antisense, 2) 
    
    #print the results
    print_ORFs('+1', frame_1_ORFs, min_ORF_length, seq)
    print_ORFs('+2', frame_2_ORFs, min_ORF_length, seq)   
    print_ORFs('+3', frame_3_ORFs, min_ORF_length, seq)
    
    print_ORFs('-1', frame_a1_ORFs, min_ORF_length, antisense)
    print_ORFs('-2', frame_a2_ORFs, min_ORF_length, antisense)   
    print_ORFs('-3', frame_a3_ORFs, min_ORF_length, antisense)
    
# findAllORF
def findAllOrf(text, limit):  # look for the file, and call the other functions


    if ((len(sys.argv) < 2) or (len(sys.argv) > 3)):
        print "Usage: python", sys.argv[0], "<filename> [<min ORF length>]"
    else:
        fileName = sys.argv[1]
        if (len(sys.argv) > 2):             # This should be an integer
            try:
                limit = int(sys.argv[2])    # Convert string to integer
            except ValueError:              # try-except catches errors
                print "\n\tExpecting an integer to define min ORF length, found",
                print sys.argv[2]
                exit()

    
    print "ORF must be at least", limit, "Base pairs long"
    
    text = cs58FileUtil.readFastaFile(fileName)
    
    process_all_reading_frames(text,limit)