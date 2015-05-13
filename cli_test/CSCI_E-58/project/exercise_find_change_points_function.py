# exercise_find_change_points_function.py    This program demos the functions to find splice site locations
# Diane Kaplan         May 2015
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

from find_splice_functions import find_change_points, put_it_all_together
#import find_splice_functions (as usual, this way wouldn't work)


DEBUG = False



    
#expect 1 change point: (length:187)
#CDK10 exon 1 only(donor at 85)
seq1 = 'ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttcc'
#splice site is at: 85
#Results: we saved position 75 (correct! splice site between that chunk and the next) 
#also saved a false positive at 150 (probably just skewed because last chunk is short)


#187
#CDK10 exons 1-2
89 & 171
##expect 3 change points:  (460 total)
seq2='ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttccaagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactc'
#splice sites are at: 89, 276, 358
#Results: 75 (correct), 175 (false pos), 225 (false pos), 275 (I'd actually expect the one before to show up as different from this), 
#425 (too late)


##expect 5 change points: (732 total)
#CDK10 exons 1-3
#exon 3 has them at 89, 170, so adding 460 makes: 549, 630
seq3='ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttccaagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactcaacggggacccctgtggctcagggagagcctcccgttcagcgctagggagcccacgaggggcatcgagatgatgtcatcaccaatgtgtttccattccagATCGGGCCCGGGACACCCAGACAGATGAGATTGTCGCACTGAAGAAGGTGCGGATGGACAAGGAGAAGGATGgtgagcaggaaattggggtgttgggacctcgcactgggaggagcagaaggatgtgagttacctgaagtttcctcagagcgactgcacggtgcttgtagc'
#splice sites are at: 89, 276, 358, 549, 630


#print find_change_points(seq2)

#=== Value & commands for sequence demo=====    
#three_exon_seq= 'ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttccaagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactcaacggggacccctgtggctcagggagagcctcccgttcagcgctagggagcccacgaggggcatcgagatgatgtcatcaccaatgtgtttccattccagATCGGGCCCGGGACACCCAGACAGATGAGATTGTCGCACTGAAGAAGGTGCGGATGGACAAGGAGAAGGATGgtgagcaggaaattggggtgttgggacctcgcactgggaggagcagaaggatgtgagttacctgaagtttcctcagagcgactgcacggtgcttgtagc'
#donor_list2= [[2], [24], [57]]
#acceptor_list2 = [[6], [40], [60]]



print find_change_points(seq1)


#do one where we give it list and pass acceptor or donor
