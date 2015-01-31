#contains_stop.py
#This program evaluates a sequence and returns a Boolean: True if the string contains a Stop codon, False if it does not
#Diane Kaplan 1/31/2015
# 
# Usage: To run on the Fasta file "sequence.fasta", type
#       % python contains_stop.py sequence.fasta
#Citations: I re-used Jeff Parker's syntax for pulling the value from a file and running it on the command line

#Assumptions: 
#The given sequence will be DNA (a, c, g, t, not RNA with U's), and will be a fasta file
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
    fileName = sys.argv[1]  # Get the file name from the command line
    
    print fileName   # Echo print 

    f = open(fileName, 'r')  # Open the file
    test_sequence = f.readline() # Read the first line of the Fasta file (describes the file)

    print "Saw", test_sequence

    #cleanup
    test_sequence = f.read()
    test_sequence = test_sequence.replace("\n", "") # Remove any new lines with global search and replace
    test_sequence = test_sequence.upper()  # Convert to Upper Case

    print "Sequence" , test_sequence, "returns ", containsStop(test_sequence)





