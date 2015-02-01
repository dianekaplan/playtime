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
    test_sequence = f.read() #UPDATING FOR TEST SEQUENCE, PUT BACK AFTER DOING DISPLAY TESTS
    
    test_sequence = test_sequence.replace("\n", "") # Remove any new lines with global search and replace
    test_sequence = test_sequence.upper()  # Convert to Upper Case

    our_results = get_bigram_info(test_sequence)
    
    #COME BACK AND DO IT WITH LOOPS- X CURSOR AND Y CURSOR
    print "For this sequence:", test_sequence
    print "      A     C     G     T       "
    print "A      ", our_results[AA], our_results[AC], our_results[AG], our_results[AT]
    print "C      ", our_results[CA], our_results[CC], our_results[CG], our_results[CT]
    print "G      ", our_results[GA], our_results[GC], our_results[GG], our_results[GT]
    print "T      ", our_results[TA], our_results[TC], our_results[TG], our_results[TT]