# findTata.py    This program looks for TATA boxes upstream of ORFs. 
# Diane Kaplan        Feb 28 - Mar 1, 2015
#
# Usage:
#     % python findTata.py <filename> [<minimal ORF length>]
# Assumptions and limitations: Assignment specifies forward direction only, so we ignore the antisense strand
# Citations: This makes use of Jeff Parker's cs58FileUtil.py for reading file and doing cleanup

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare, readFastaFile
from helper_functions import find_ORFs, get_TATAA_info #functions from assignment 3

DEBUG = False

#Take the ORF location dictionary, min length we want, and the full seq. 
#Print the upstream TATAAs & friends (hamming distance 2 or better) ORFs >= minimal size
def get_upstream_motifs(frame, ORF_dict, min_ORF_length, sequence): 
    TATAA = 'TATAA'
    motif_list= []    
    count = len(ORF_dict)
    if count ==0: 
        print "There were no ORFs in this sequence."
    else: 
        for ORF in ORF_dict: 
            length = ORF_dict[ORF] + 1 - ORF #we want the length in bases, so just like slicing we need to go one past the end
            
            upstream_words = []
            
            if length >= min_ORF_length:
                    upstream_words.append (sequence[ORF-11:ORF-5])
                    upstream_words.append (sequence[ORF-10:ORF-4])
                    upstream_words.append (sequence[ORF-9:ORF-3])
                    upstream_words.append (sequence[ORF-8:ORF-2])
                    upstream_words.append (sequence[ORF-7:ORF-1])
                    
                    for variation in upstream_words: 
                        hamming_dist = 0  #reset this for each snippet
                        for x in xrange(0,5): 
                            if TATAA[x] != variation[x]: 
                                hamming_dist +=1
                        if hamming_dist < 3:
                            motif_list.append(variation)
                        if (DEBUG):
                            print frame, "Start", ORF, "End", ORF_dict[ORF],"Len" ,length, "Seq", sequence[ORF-1:ORF-1 + snippet_length] , "... Upstream has:", variation, hamming_dist
        
        if (DEBUG):
          print motif_list       
    return motif_list
    
limit = 100  # How many base pairs long must an ORF be? We can override this value with a Command Line Parameter
snippet_length= 15 #How many bp to print for each in debug output (assumed to be less than limit, otherwise we'll go out of bounds)


if ((len(sys.argv) < 2) or (len(sys.argv) > 3)):
    print "Usage: python", sys.argv[0], "<filename> [<min ORF length>]"
else:
    fileName = sys.argv[1]
    if (len(sys.argv) > 2):             # This should be an integer
        try:
            limit = int(sys.argv[2])    # Convert string to integer
        except ValueError:              # try-except catches errors
            print "\n\tExpecting an integer to define min ORF length, found",
            print sys.argv[2]
            exit()
            
seq = readFastaFile(fileName) 
seq = prepare(seq)


min_ORF_length = limit

#get dictionary of ORF start and end locations for each reading frame (any length), using offset to start cursor in the right place)
frame_1_ORFs= find_ORFs(seq, 0)  
frame_2_ORFs= find_ORFs(seq, 1) 
frame_3_ORFs= find_ORFs(seq, 2) 
    
motifs_for_all_frames = []

frame1_motifs = get_upstream_motifs('+1', frame_1_ORFs, min_ORF_length, seq)
frame2_motifs = get_upstream_motifs('+2', frame_2_ORFs, min_ORF_length, seq)
frame3_motifs = get_upstream_motifs('+3', frame_3_ORFs, min_ORF_length, seq)

if len(frame1_motifs) > 0:
    motifs_for_all_frames.extend(frame1_motifs)
if len(frame2_motifs) > 0:
    motifs_for_all_frames.extend(frame2_motifs)
if len(frame3_motifs) > 0:
    motifs_for_all_frames.extend(frame3_motifs)

print "ORF must be at least", limit, "Base pairs long"
print "The qualifying upstream motifs are: ", motifs_for_all_frames

a_tallies = [0, 0, 0, 0, 0, 0]
c_tallies = [0, 0, 0, 0, 0, 0]
g_tallies = [0, 0, 0, 0, 0, 0]
t_tallies = [0, 0, 0, 0, 0, 0]

tally_list = [a_tallies, c_tallies, g_tallies, t_tallies]

#process each motif and update the tally lists
for motif in motifs_for_all_frames:
    for x in xrange(0,6): 
        which_base = motif[x]
        if which_base =="A":
            which_tally_list = 0
        if which_base =="C":
            which_tally_list = 1
        if which_base =="G":
            which_tally_list = 2
        if which_base =="T":
            which_tally_list = 3
            
        tally_list[which_tally_list][x] +=1 
if (DEBUG):
    print tally_list

print "Here are the base counts at each position:"
print "A ", a_tallies[0], a_tallies[1], a_tallies[2], a_tallies[3], a_tallies[4], a_tallies[5]
print "C ", c_tallies[0], c_tallies[1], c_tallies[2], c_tallies[3], c_tallies[4], c_tallies[5]
print "G ", g_tallies[0], g_tallies[1], g_tallies[2], g_tallies[3], g_tallies[4], g_tallies[5]
print "T ", t_tallies[0], t_tallies[1], t_tallies[2], t_tallies[3], t_tallies[4], t_tallies[5]
