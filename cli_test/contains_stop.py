#contains_stop.py
#Diane Kaplan 1/31/2015
# Bugs: no validation that the file is a Fasta DNA file.
#       Assumes contents are a, c, g, and t.
# 
# Usage: To run on the Fasta file "EcoliK12.fasta", type
#       % python frequency.py EcoliK12.fasta
#citations: none this time

#3) Write a Python function that takes a string, and returns a Boolean.  
#It returns True if the string represents a Stop codon, and false if it does not.  

#Take the string, save the codons, search the codons for a stop, return answer

#Assumptions: 
#The given sequence will be uppercase DNA
#The given sequence will start from the desired reading frame

#Tested: 
#checked all 3 stop codons, checked first, middle, and last positions, with and without trailing bases
#confirmed that it ignores trailing bases (returns false if end with TAA but not mulitple of 3)
 
import sys      # Used for Command Line Parameters
 
def containsStop(seq):
    seqLen = len(seq)  
    number_of_codons = seqLen/3  #I'll ignore extra bases on the end
    #loop through and save the codons
    codon_cursor = 0
    cursor = 0
    codon_list=[]
    stop_codons=['TAA', 'TAG', 'TGA']
    
    #First get the list of codons
    while codon_cursor < number_of_codons:
        this_codon = seq[cursor:cursor+3]
        codon_cursor +=1    
        cursor += 3
        codon_list.append(this_codon)
    #print codon_list
            
    #then see if any of them are stop codons  
    for codon in codon_list: 
        #print "I'm checking", codon
        if codon in stop_codons: 
            contains_stop = True
            return contains_stop   
        else:
            contains_stop = False
        
    return contains_stop        
    
#Now let's call it
#test_sequence = ''
#test_sequence = 'TAAGGGGGGGGTAA' 

if (len(sys.argv) != 2):
    print "Usage: python", sys.argv[0], "<filename>"
else:
    # Get the file name from the command line
    fileName = sys.argv[1]

    # Echo print 
    print fileName

    # Open the file
    f = open(fileName, 'r')

    # Read the first line of the file
    # First line in Fasta Format describes the file
    test_sequence = f.readline()

    print "Saw", test_sequence

    test_sequence = f.read()

    # Remove any new lines with global search and replace
    #text = text.replace("\n", "")

    # Convert to Upper Case
    test_sequence = test_sequence.upper()
    

    print "Sequence" , test_sequence, "returns ", containsStop(test_sequence)





