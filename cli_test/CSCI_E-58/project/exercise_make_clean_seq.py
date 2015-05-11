# exercise_make_clean_seq.py    This program demos make_clean_seq, using the alphabet because it's recognizable
# Diane Kaplan        April - May 2015
#
# Assumptions and limitations: (none)
# Citations: (none)
#
#import string
#import sys
#from cs58FileUtil import prepare, readFastaFile
#import profile

from find_splice_functions import make_clean_seq

    
seq= 'abcdXXXXXXXXXXXXXXefghijklXXXXXXXXXXXXXXXXXXXXXXXXXXmnopqrsXXXXXXXXXXXXXtuvwxyz'

#for donor motif, the first 3 bases are still exon, then intron starts at 4: 
#for acceptor motif (scored as a 14mer), exclude everything but the last 2: acag|AG
donor_list= [[2], [24], [57]]
acceptor_list = [[6], [40], [60]]

#Let's update the splice sites as if that first intron goes the rest of the way
donor_list2= [[2]] 
acceptor_list2 = [[len(seq)]]  #usage for cases where there's only a donor site (seq only has exon-intron)

#Now let's update the splice sites as if it's intron all the way to tuvwyz
donor_list3= [[len(seq)]]  #usage for cases where there's only an acceptor site (seq only has intron-exon)
acceptor_list3 = [[60]]

#Finally, see what happens if we pass an empty list 
donor_list4= []  #usage for cases where there's only an acceptor site (seq only has intron-exon)
acceptor_list4 = [[60]]

print "Strip introns from the alphabet: ",  make_clean_seq (seq, donor_list, acceptor_list)
print "Give positions for only first donor site: ",  make_clean_seq (seq, donor_list2, acceptor_list2)
print "Give positions for only last acceptor site: ",  make_clean_seq (seq, donor_list3, acceptor_list3)
print "Give empty list (prompt the user): ",  make_clean_seq (seq, donor_list4, acceptor_list3)

