# Find_splice.py    This program takes a sequence finds the intron splice sites
# Diane Kaplan        April 2015
#
# Usage:
#     % python Find_splice.py <filename> [<minimal ORF length>]
# Assumptions and limitations: 
# Citations: 
#Got general base frequencies for humans from here: http://seqanswers.com/forums/archive/index.php/t-12359.html

import string
import sys
#import cs58FileUtil  #doing the whole thing didn't work; prepare was considered undefined
from cs58FileUtil import prepare, readFastaFile
import profile
#from helper_functions import find_ORFs, get_TATAA_info

DEBUG = False


#Take a string and type of motif (donor or acceptor)
#Return it's probability as this motif if higher than happening by chance, otherwise return false
def evaluate_motif(string, motif_type): 
    seq = string
    prob_general = 0
    prob_in_motif = 0
    length = len(seq)

    valid_types = ["donor", "acceptor"]
    if motif_type not in valid_types:
        sys.exit()  #ALSO CHECK FOR THIS IN THE USAGE, BUT HANDLING HERE JUST IN CASE

    #Emission probabilities:     
    general_prob = {'A': .2725, 'C': .189, 'G': .189, 'T':.2728}
    
    if motif_type == "donor":
        pos1_prob = {'A': .4, 'C': .4, 'G': 0, 'T':.2}
        pos2_prob = {'A': .4, 'C': .2, 'G': .2, 'T':.2}
        pos3_prob = {'A': .13, 'C': .13, 'G': .61, 'T':.13}
        pos4_prob = {'A': 0, 'C': 0, 'G': 1, 'T':.0}
        pos5_prob = {'A': 0, 'C': 0, 'G': 0, 'T':1}
        pos6_prob = {'A': .4, 'C': .1, 'G': .4, 'T':.1}
        pos7_prob = {'A': .61, 'C': .13, 'G': .13, 'T':.13}
        pos8_prob = {'A': .1, 'C': .1, 'G': .7, 'T':.1}
        pos9_prob = {'A': .25, 'C': .25, 'G': .25, 'T':.25}    
        
        library_list = [pos1_prob, pos2_prob, pos3_prob, pos4_prob, pos5_prob, pos6_prob, pos7_prob, pos8_prob, pos9_prob] 
        weight_list = [1, 1, 1, 1, 1, 1, 1, 1, 1] 

    elif motif_type == "acceptor": 
        #pos1_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        #pos2_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        #pos3_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos1_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos2_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos3_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos4_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos5_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3} 
        pos6_prob = {'A': .20, 'C': .3, 'G': .2, 'T':.3}  
        pos7_prob = {'A': .15, 'C': .30, 'G': .1, 'T':.45}
        pos8_prob = {'A': .15, 'C': .30, 'G': .1, 'T':.45}
        pos9_prob = {'A': .25, 'C': .25, 'G': .25, 'T':.25}
        pos10_prob = {'A': .1, 'C': 6, 'G': 0, 'T':.3}
        pos11_prob = {'A': 1, 'C': 0, 'G': 0, 'T':0}
        pos12_prob = {'A': 0, 'C': 0, 'G': 1, 'T':0}  
        pos13_prob = {'A': .2, 'C': .2, 'G': .3, 'T':.2}  
        pos14_prob = {'A': .2725, 'C': .189, 'G': .189, 'T':.2728} 
        
    #We'll put them into a list for easier comparison at that position
        library_list = [pos1_prob, pos2_prob, pos3_prob, pos4_prob, pos5_prob, pos6_prob, pos7_prob, pos8_prob, pos9_prob, pos10_prob, pos11_prob, pos12_prob, pos13_prob, pos14_prob]             
        weight_list = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]             
        
    #first get the probability of getting this in general (normal state)
    cursor=0
    tally = 1
    this_dict = general_prob
    while cursor < length:
        base = seq[cursor]  
        this_prob = (this_dict[base])
        tally *= this_prob
        #print "position " + str(cursor) + ": " + base + " probability in this dictionary is " + str(this_prob) + ". Tally: " + str(tally)
        cursor += 1
    prob_general= tally

    #then get the probability of this being emitted from motif state
    cursor=0
    tally = 1
    while (cursor < length) and tally > 0:  #we drop out if it becomes impossible
        base = seq[cursor]
        this_dict = library_list[cursor]
        this_weight= weight_list[cursor]
        this_prob = (this_dict[base])

        tally *= this_prob
        cursor += 1
    prob_in_motif = tally
    
    if prob_in_motif > prob_general: 
        verdict = prob_in_motif
    else: 
        verdict = False #  probability of happening by chance was higher
    
    return verdict
    

#take a sequence and find the splice sites for given motif type
#ADD SOME VALIDATION FOR LENGTH TO CHECK OR HARD CODE IT FOR TYPE
def find_motif(seq, motif_type, length_to_check): 
    total_length = len(seq)
    length_to_check = length_to_check
    cursor = 0
    candidate_list=[]  #save starting position, snippet, and score
    
    while (cursor <= total_length-length_to_check): 
        this_segment = seq[cursor:cursor+length_to_check] 
        score = evaluate_motif(this_segment, motif_type)
        if score:
            candidate_list.append([cursor+1 , this_segment, score])
        cursor += 1
    return candidate_list



def reverse_complement(sequence): #taken from my homework
    seq= sequence
    seq_backward = seq[::-1] 
    base_partners = {"A":"T", "C":"G", "G":"C", "T":"A"} 
    seq_converted = ""  
    
    for char in seq_backward: #Loop through and look up the complement to create the new sequence
        seq_converted += base_partners[char]

    return seq_converted

#Take a list of lists for the splice sites identified, and return the one with the highest probability
def get_winner (list): 
    top_score = 0
    winning_list = ''
    for x in list:  #could  use max() for the top score, but also want to know which list, there's probably a better way
        if x[2] > top_score:
            top_score = x[2]  
            winning_list = x      
    return winning_list


def make_clean_seq (seq, donor_list, acceptor_list): #donor or acceptor can be missing, but not both- maybe have usage to pass -1 if none
    orig_seq = (seq)
    clean_seq =''
    total_length = len(orig_seq)
    donor_list = donor_list
    acceptor_list = acceptor_list
    cursor = 0

    donor_positions_list = [x[0] for x in donor_list]  #yay list comprension
    first_donor = min(donor_positions_list)
    last_donor = max(donor_positions_list)
    
    acceptor_positions_list = [x[0] for x in acceptor_list]  #yay list comprension
    first_acceptor = min(acceptor_positions_list)
    last_acceptor = max(acceptor_positions_list)
    
    #stopping_point = max (last_donor, last_acceptor) 
    
    
    in_intron = False #initialize to False
    in_exon = False  
           
    if first_donor < first_acceptor: #if there's a donor site first, we're starting in an exon
        in_exon= True

    if first_acceptor < first_donor: #if there's an acceptor site first, we're starting in an intron
        in_intron= True

    while (cursor < total_length ) and (in_exon or in_intron): # want to continue til we've dealt with them all
        if in_exon: #we'll add to the clean_seq, up to the next donor splice or the end if there are none
            if (DEBUG):
                print  "Cursor is: ", cursor, "and I'm in an exon"
            next_donors = [x for x in donor_positions_list if (x>cursor)]
            if next_donors:
                upcoming_donor = min(next_donors) 
                #print "next_donor is: ", upcoming_donor
                #in the donor motif, the first 3 bases are still exon, then intron starts at 4
                clean_seq += seq[cursor:upcoming_donor+2]
                cursor = min(next_donors) 
                in_intron = True
                if (DEBUG):
                    print "clean_seq is: ", clean_seq
            else: #we're done
                if (DEBUG):
                    print "we're ending in an exon"
                #if we're ending in an exon, add the rest til the end of seq
                clean_seq += seq[cursor:]
                cursor +=1
                if (DEBUG):
                    print "clean_seq is: ", clean_seq
            in_exon = False #we're done now
        if in_intron:
            if (DEBUG):
                print "Cursor is: ", cursor, "and I'm in an intron"
            next_acceptors = [x for x in acceptor_positions_list if (x>cursor)]
            #for acceptor motif, exclude everything but the last 2: acag|AG
            if next_acceptors:
                if (DEBUG):
                    print "next_acceptor starts at: ", min(next_acceptors) 
                #introns are of varying lengths- we need to know the end of it and resume cursor 2 before that
                cursor = min(next_acceptors) +12
                in_exon = True 
                if (DEBUG):
                    print "clean_seq is: ", clean_seq
            else: #we're done
                cursor +=1
                if (DEBUG):
                    print "clean_seq is: ", clean_seq
            in_intron = False
   # print "in_exon: ", in_exon, "in_intron: ", in_intron, "stopping point: ", stopping_point
    #      temp= x[0]
    #      print temp
           #donor_positions_list.append(x[0])
    #for x in acceptor_list:
    #       acceptor_positions_list.append(x[0])

 
    #We'll assume proper nesting for now

    #First, figure out where we're starting (in the middle of an exon, or the middle of an intron)
    first_splice = ''
    
    
    #IF YOU STRIP STUFF OUT, THE POSITIONS MOVE 
    #so keep the original, and have a new one you're making using the good stuff
    
    while (cursor <= total_length ): 
        #do stuff
        cursor += 1
    return clean_seq
        
    
if (DEBUG):
    print "we're in debug mode"
    
    
    
    
#CDK10, exon 2
seq= 'aagacgtgagtgggctccctggtacaaattccatttgaaatttcctcagttgttccatcagctgccaaatttccacactggcaacacccttctgtttcagCTGGGACGATGCCGGAGTGTGAAGGAGTTTGAGAAGCTGAACCGCATTGGAGAGGGTACCTACGGCATTGTGTgtgagtggccaaggctaggacatgtggccgcagctcgtggctgtgacagtgtgggacgagactgtcgaagcagcagccgcgttggggctggaagggactc'


seq= prepare(seq) 
#donor_result = find_motif (seq, 'donor', 9)
#acceptor_result =  find_motif (seq, 'acceptor', 14)


#print 'Donor motifs in this seq:' 
#for result in donor_result:
#    print result
#
#print '\nAcceptor motifs in this seq:'
#for result in acceptor_result:
#    print result



#====Then I want a way to get all the winning sites for the whole sequence, so I can pass them all in 
#and have the program give me the cleaned sequence

seq= 'abcdXXXXXXXXXXXXXXefghijklXXXXXXXXXXXXXXXXXXXXXXXXXXmnopqrsXXXXXXXXXXXXXtuvwxyz'

donor_list= [[2, 'AATGTGAGT', 0.00022204000000000006], [24, 'TGTGTGAGT', 0.00022204000000000006], [57, 'CTTCTGTTTCAGCT', 8.0542836e-06]]
acceptor_list = [[6, 'CTTCTGTTTCAGCT', 8.0542836e-06], [40, 'CTTCTGTTTCAGCT', 8.0542836e-06], [60, 'CTTCTGTTTCAGCT', 8.0542836e-06]]

#in the donor motif, the first 3 bases are still exon, then intron starts at 4
#donor list: 2, 24, 57
#acceptor list: 14, 23, 44

#q is 57th
#for acceptor motif (scored as a 14mer), exclude everything but the last 2: acag|AG
print make_clean_seq (seq, donor_list, acceptor_list)

