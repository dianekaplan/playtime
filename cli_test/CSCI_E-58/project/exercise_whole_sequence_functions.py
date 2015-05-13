# exercise_whole_sequence_functions.py    This program demos make_clean_seq and put_it_all_together
# Diane Kaplan        April - May 2015
#
# Usage:
#     % python exercise_whole_sequence_functions.py 
# Assumptions and limitations: (none)
# Citations: (none)

from find_splice_functions import make_clean_seq, put_it_all_together


# === Value & commands for sequence demo=====   
# CDK10 gene, including exons 1-3 (in CAPS) and shortened intron chunks (lowercase)
# In this file I did NOT include cs58FileUtil for the prepare function, so I could see any mistaken lowercase intron bases 
seq3='ATGGCGGAGCCAGATCTGGAGTGCGAGCAGATCCGTCTGAAGTGTATTCGTAAGGAGGGCTTCTTCACGGTGCCTCCGGAACACAGGgtgcgcggggtgccacccgggcagctctgcccgcctcgctagcggcactgcccggctgggtctggggagcctcgtgtcgcgctgccgcgccgaggcttccaagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactcaacggggacccctgtggctcagggagagcctcccgttcagcgctagggagcccacgaggggcatcgagatgatgtcatcaccaatgtgtttccattccagATCGGGCCCGGGACACCCAGACAGATGAGATTGTCGCACTGAAGAAGGTGCGGATGGACAAGGAGAAGGATGgtgagcaggaaattggggtgttgggacctcgcactgggaggagcagaaggatgtgagttacctgaagtttcctcagagcgactgcacggtgcttgtagc'


    
# === Value & commands for alphabet demo=====    
seq= 'abcdXXXXXXXXXXXXXXefghijklXXXXXXXXXXXXXXXXXXXXXXXXXXmnopqrsXXXXXXXXXXXXXtuvwxyz'

# For donor motif, the first 3 bases are still exon, then intron starts at 4: 
# For acceptor motif (scored as a 14mer), exclude everything but the last 2: acag|AG
donor_list= [[2], [24], [57]]
acceptor_list = [[7], [41], [61]]

# Let's update the splice sites as if that first intron goes the rest of the way
donor_list2= [[2]] 
acceptor_list2 = [[len(seq)]]  # usage for cases where there's only a donor site (seq only has exon-intron)

# Now let's update the splice sites as if it's intron all the way to tuvwyz
donor_list3= [[len(seq)]]  # usage for cases where there's only an acceptor site (seq only has intron-exon)
acceptor_list3 = [[61]]

# Finally, see what happens if we pass an empty list 
donor_list4= []  
acceptor_list4 = [[61]]

print "First, let's run put_it_all_together for a 3-intron sequence: "
print seq3
print "\nThe cleaned up result we get back is:" 
print put_it_all_together(seq3)
       
print "To more easily be able to see that the parts are right:"

print "Here's from the beginning to donor at 85: " , seq3[0:85+3-1]  #we go to the cursor +3 because donor, -1 because cursor not position
print "Here's the next chunk, from acceptor at 276 to donor at 358: " , seq3[276+14-2-1:358+3-1]        
print "Here's the next chunk, from acceptor at 549 to donor at 630: " , seq3[549+14-2-1:630+3-1]    


print "\nNow, using a more visible example (the alphabet), let's look closer at make_clean_seq.  We'll test using: "
print seq
print "Strip the introns from this sequence: ",  make_clean_seq (seq, donor_list, acceptor_list)
print "Adjust parameters so we only give position for the first donor site: ",  make_clean_seq (seq, donor_list2, acceptor_list2)
print "Now give positions for only last acceptor site: ",  make_clean_seq (seq, donor_list3, acceptor_list3)

print "Give empty list (prompt the user): ",  make_clean_seq (seq, donor_list4, acceptor_list3)

