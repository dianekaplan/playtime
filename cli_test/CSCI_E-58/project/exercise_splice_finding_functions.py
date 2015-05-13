# exercise_splice_finding_functions.py    This program demos the functions to find splice site locations
# Diane Kaplan        April - May 2015
#
# Usage:
#     % python exercise_splice_finding_functions.py 
# Assumptions and limitations: (none)
# Citations: (none)

import string
import sys
from cs58FileUtil import prepare, readFastaFile
import profile

from find_splice_functions import evaluate_motif, find_motif, get_winner


DEBUG = False

#CDK10, exon 1
#seq1='ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttcc'

# CDK10, exon 2
#seq2= 'aagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactc'

# CDK10, exon 3
seq3 = 'aacggggacccctgtggctcagggagagcctcccgttcagcgctagggagcccacgaggggcatcgagatgatgtcatcaccaatgtgtttccattccagATCGGGCCCGGGACACCCAGACAGATGAGATTGTCGCACTGAAGAAGGTGCGGATGGACAAGGAGAAGGATGgtgagcaggaaattggggtgttgggacctcgcactgggaggagcagaaggatgtgagttacctgaagtttcctcagagcgactgcac ggtgcttgtagc'

# CDK10, exon 4
#seq4 = 'gcacctgctatcaggtgttcgtgaagcccaagagtggctggggttggggcttccccgccatcactggggtggggctcgctgaggccacctccctccccagGCATCCCCATCAGCAGCTTGCGGGAGATCACGCTGCTGCTCCGCCTGCGTCATCCGAACATCGTGGAGCTGAAGGAGGTGGTTGTGGGGAACCACCTGGAGAGgtacgtggtctcctggtctgcacattgggccctagggagcatgtgtcttgggctagaggtgttgcacagagcgaggactgagtgtcactgggcatgaggt'

# ALDH10, exon 1: 
#seq5='ATGGAGCTCGAAGTCCGGCGGGTCCGACAGGCGTTCCTGTCCGGCCGGTCGCGACCTCTGCGGTTTCGGCTGCAGCAGCTGGAGGCCCTGCGGAGGATGGTGCAGGAGCGCGAGAAGGATATCCTGACGGCCATCGCCGCCGACCTGTGCAAGgtacgcacgcgtgcggcggggtgtggggaaactggcccccgccgcgcacttgtggactggagcttcggctgggttttgtttttgcttttacatttcggat'

# ALDH10, exon 2: 
#seq6= 'ttgttgtcactacaggtgtacctggtgtgagtgttctgacattcagggccaagtgtatcatacttactctgcaagattaactgtgattctcttataacagAGTGAATTCAATGTGTACAGTCAGGAAGTCATTACTGTCCTTGGGGAAATTGATTTTATGCTTGAGAATCTTCCTGAATGGGTTACTGCTAAACCAGTTAAGAAGAACGTGCTCACCATGCTGGATGAGGCCTATATTCAGCCACAGCCTCTGGGAGTGGTGCTGATAATCGGAGCTTGGAATTACCCCTTCGTTCTCACCATTCAGCCACTGATAGGAGCCATCGCTGCAGgtctggtgccaccttatgtctatatacctttttagggaggcttattttctcatattaattggaaattaaggatagtggctaattaaatacatttacttgg'

# ALDH10, exon 3: 
#seq7 = 'taattgggagtacctagcctgttcttcccactgaacatcattttggtagctattaaagttaaatattagatgatactgttctactttttactttatttagGAAATGCTGTGATTATAAAGCCTTCTGAACTGAGTGAAAATACAGCCAAGATCTTGGCAAAGCTTCTCCCTCAGTATTTAGACCAGgtaagaatttcttgactcatctccaacatatgtgtttactgtggaaaacacacattttattttcttgctattgcatgttattgctggccggggacccaat'

seq= prepare(seq3) 
donor_result = find_motif (seq, 'donor', 0)
acceptor_result =  find_motif (seq, 'acceptor', 0)

print 'Testing CDK10, exon 3: '
print seq3
print '\nAcceptor motifs in this seq:'
for result in acceptor_result:
    print result
    
print '\nDonor motifs in this seq:' 
for result in donor_result:
    print result

winning_donor = get_winner(donor_result) 
winning_acceptor = get_winner(acceptor_result) 

print "Winning acceptor site: ", winning_acceptor, "and the winning donor site: ", winning_donor


