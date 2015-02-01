#countBigram.py
#This program reads in a FASTA file and displays instances of each digram
#Diane Kaplan 1/31/2015
# 
# Usage: To run on the Fasta file "sequence.fasta", type
#       % python countBigram.py sequence.fasta
#Citations: I re-used syntax from Jeff Parker file for using command line to pull the value from a file and clean it up for use
#Assumptions: Assuming the sequence is made up of ATCG. Based on example in description we include overlaps (For ex ACTT counts for AC, CT, and TT). 
#
#Tested: made sure results were correct for example sequence (includes bigrams with 0, 1, and 2)
 
import sys      # Used for Command Line Parameters

def get_bigram_info(seq):
    seqLen = len(seq)  
    cursor = 0
    results = {'AA':0, 'AC':0, 'AT':0, 'AG': 0, 'CA':0, 'CC':0, 'CT':0, 'CG': 0,'TA':0, 'TC':0, 'TT':0, 'TG': 0,'GA':0, 'GC':0, 'GT':0, 'GG': 0,} 

    #Grab each one, and increment that entry in the dictionary
    while cursor < seqLen-1: 
        this_snippet = seq[cursor:cursor+2]
        results[this_snippet] +=1
        cursor +=1        
    return results     
                             
    
# Check for a file specified on the command line 
if (len(sys.argv) != 2):
    print "Usage: python", sys.argv[0], "<filename>"
else:
    fileName = sys.argv[1]  # Get the file name from the command line

    f = open(fileName, 'r')  # Open the file
    file_description = f.readline() # Read the first line of the Fasta file (describes the file)
    print "This fasta file is:", file_description

    #get our sequence clean
    test_sequence = f.read()
    test_sequence = test_sequence.replace("\n", "") # Remove any new lines with global search and replace
    test_sequence = test_sequence.upper()  # Convert to Upper Case

    print "For this sequence:", test_sequence, "Here are the counts: ", get_bigram_info(test_sequence)


