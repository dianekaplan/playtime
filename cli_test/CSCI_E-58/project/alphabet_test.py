# alphabet_test.py    This program takes a sequence finds the intron splice sites
# Diane Kaplan        May 2015
#
# Usage:
#     % python Find_splice.py <filename> [<minimal ORF length>]
# Assumptions and limitations: 
# Citations: 

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare, readFastaFile
import profile

from find_splice_functions import evaluate_motif, find_motif, reverse_complement, get_winner, make_clean_seq
#import find_splice_functions (as usual, this way wouldn't work)


DEBUG = False


seq= 'abcdXXXXXXXXXXXXXXefghijklXXXXXXXXXXXXXXXXXXXXXXXXXXmnopqrsXXXXXXXXXXXXXtuvwxyz'

#for donor motif, the first 3 bases are still exon, then intron starts at 4: 
#for acceptor motif (scored as a 14mer), exclude everything but the last 2: acag|AG
donor_list= [[2], [24], [57]]
acceptor_list = [[6], [40], [60]]



print make_clean_seq (seq, donor_list, acceptor_list)

