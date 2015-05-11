# exercise_splice_finding_functions.py    This program demos the functions to find splice site locations
# Diane Kaplan        April - May 2015
#
# Usage:
#     % python exercise_functions.py <filename> [<minimal ORF length>]
# Assumptions and limitations: (none)
# Citations: (none)

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare, readFastaFile
import profile

from find_splice_functions import evaluate_motif, find_motif, get_winner
#import find_splice_functions (as usual, this way wouldn't work)


DEBUG = False

#  exercise find_donor_motif
#CDK10, exon 1
#seq='ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttcc'

#CDK10, exon 2
#seq= 'aagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactc'

#CDK10, exon 3
seq = 'aacggggacccctgtggctcagggagagcctcccgttcagcgctagggagcccacgaggggcatcgagatgatgtcatcaccaatgtgtttccattccagATCGGGCCCGGGACACCCAGACAGATGAGATTGTCGCACTGAAGAAGGTGCGGATGGACAAGGAGAAGGATGgtgagcaggaaattggggtgttgggacctcgcactgggaggagcagaaggatgtgagttacctgaagtttcctcagagcgactgcac ggtgcttgtagc'

#CDK10, exon 4
#seq = 'gcacctgctatcaggtgttcgtgaagcccaagagtggctggggttggggcttccccgccatcactggggtggggctcgctgaggccacctccctccccagGCATCCCCATCAGCAGCTTGCGGGAGATCACGCTGCTGCTCCGCCTGCGTCATCCGAACATCGTGGAGCTGAAGGAGGTGGTTGTGGGGAACCACCTGGAGAGgtacgtggtctcctggtctgcacattgggccctagggagcatgtgtcttgggctagaggtgttgcacagagcgaggactgagtgtcactgggcatgaggt'

#ALDH10, exon 1: 
#seq='ATGGAGCTCGAAGTCCGGCGGGTCCGACAGGCGTTCCTGTCCGGCCGGTCGCGACCTCTGCGGTTTCGGCTGCAGCAGCTGGAGGCCCTGCGGAGGATGGTGCAGGAGCGCGAGAAGGATATCCTGACGGCCATCGCCGCCGACCTGTGCAAGgtacgcacgcgtgcggcggggtgtggggaaactggcccccgccgcgcacttgtggactggagcttcggctgggttttgtttttgcttttacatttcggat'

#ALDH10, exon 2: 
#seq= 'ttgttgtcactacaggtgtacctggtgtgagtgttctgacattcagggccaagtgtatcatacttactctgcaagattaactgtgattctcttataacagAGTGAATTCAATGTGTACAGTCAGGAAGTCATTACTGTCCTTGGGGAAATTGATTTTATGCTTGAGAATCTTCCTGAATGGGTTACTGCTAAACCAGTTAAGAAGAACGTGCTCACCATGCTGGATGAGGCCTATATTCAGCCACAGCCTCTGGGAGTGGTGCTGATAATCGGAGCTTGGAATTACCCCTTCGTTCTCACCATTCAGCCACTGATAGGAGCCATCGCTGCAGgtctggtgccaccttatgtctatatacctttttagggaggcttattttctcatattaattggaaattaaggatagtggctaattaaatacatttacttgg'

#ALDH10, exon 3: 
#seq = 'taattgggagtacctagcctgttcttcccactgaacatcattttggtagctattaaagttaaatattagatgatactgttctactttttactttatttagGAAATGCTGTGATTATAAAGCCTTCTGAACTGAGTGAAAATACAGCCAAGATCTTGGCAAAGCTTCTCCCTCAGTATTTAGACCAGgtaagaatttcttgactcatctccaacatatgtgtttactgtggaaaacacacattttattttcttgctattgcatgttattgctggccggggacccaat'

seq= prepare(seq) 
donor_result = find_motif (seq, 'donor', 0)
acceptor_result =  find_motif (seq, 'acceptor', 0)

print '\nAcceptor motifs in this seq:'
for result in acceptor_result:
    print result
    
print '\nDonor motifs in this seq:' 
for result in donor_result:
    print result

winning_donor = get_winner(donor_result) 
winning_acceptor = get_winner(acceptor_result) 

print "Winning acceptor site: ", winning_acceptor, "and the winning donor site: ", winning_donor


