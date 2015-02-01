#DK_problem_five.py
#This program reads in a FASTA file and returns info about TATAAT occurrences in the forward direction
#Diane Kaplan 1/31/2015
# 
# Usage: To run on the Fasta file "sequence.fasta", type
#       % python DK_problem_five.py sequence.fasta
#Citations: I re-used syntax from Jeff Parker file for using command line to pull the value from a file and clean it up for use
#Assumptions: none
#Tested: sequences with none, 1 at the start, 1 in the middle, 1 at the end, and multiple instances
 
import sys      # Used for Command Line Parameters
 
def get_TATAAT_info(seq):
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

    print "For this sequence:" , test_sequence, "Location of first instance, last instance, number of instances: ", get_TATAAT_info(test_sequence)




