# frequency.py
# Jeff Parker      Jan 2009
#
# Count the frequency of each base in a sequence found in a Fasta File
# This uses a command line parameter to hold the file name
# 
# Bugs: no validation that the file is a Fasta DNA file.
#       Assumes contents are a, c, g, and t.
# 
# Usage: To run on the Fasta file "EcoliK12.fasta", type
#       % python frequency.py EcoliK12.fasta

import sys      # Used for Command Line Parameters

# How frequently does each character in text appear?
def countChars(text):
    # Create an empty hash table
    symbolCounts = {}
    #why not initialize this with 0s, then we don't need the extra logic here or below in the print function

    # Go over each letter in the sequence
    for x in xrange(len(text)):
        ch = text[x]
        # Increment count
        if (ch in symbolCounts):
            symbolCounts[ch] = symbolCounts[ch] + 1
        else:
            symbolCounts[ch] = 1

    # Return counts
    return symbolCounts

# Print the contents of a Dictionary holding DNA bases
# We are assuming that bases are Upper Case
def printDict(dict):

    # Rough print: we don't control order
    print dict

    # Create a list of symbols
    # Change the list order to change the output order
    symbols = ['A', 'C', 'G', 'T']

    # Iterate over the list of symbols
    for ch in symbols:

        # For each member, if the member is in the hash table
        if (ch in dict):
            print ch, dict[ch]
        else:
            print ch, 0

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
    text = f.readline()

    # Sanity check - what does this file hold?
    print "Saw", text

    # Read the rest of the file in one gulp
    # This program could process one line at a time
    # Later problems are simpler if we have a single string
    text = f.read()

    # Remove any new lines with global search and replace
    text = text.replace("\n", "")

    # Convert to Upper Case
    text = text.upper()
    
    # Call our function to count the characters
    dict = countChars(text)

    # Call our function to print the results
    printDict(dict)