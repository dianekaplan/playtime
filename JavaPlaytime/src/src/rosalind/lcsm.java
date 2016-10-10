package rosalind;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Diane on 10/9/2016.

 */
public class lcsm {

    public static void main(String[] args) {

        int new_var = rosalind.fasta_utils.test();
        String file_to_use = "C:\\Users\\Diane\\Documents\\GitHub\\playtime\\JavaPlaytime\\src\\src\\rosalind\\dna.txt";
        List seq_list = rosalind.fasta_utils.get_seq_strings(file_to_use);

        System.out.println("Longest substring in common is: " + find_longest_substring(seq_list));
    }


    protected static String find_longest_substring(List<String> list) {

        boolean DEBUG = false;

        int sequence_count = list.size();

        int winning_length = 0;
        String winning_seq = "";

        // I'll start with the first string, and move through it from 2 - n,
        // look for a matching 2bp, 3bp, 4bp etc that appears in the other strings
        // best case would be that all sequences contain the shortest seq in the list

        if (DEBUG) {System.out.println("Our list has: " + sequence_count + " strings:" + list);}

        String first_seq = list.get(0);
        int first_seq_len = first_seq.length();
        int size_of_shortest_seq = first_seq_len; // initialize to that for comparison later
        boolean found_the_answer = false;

        for (String str : list) {
            if (str.length() < size_of_shortest_seq) {
                size_of_shortest_seq = str.length();
            }
        }

        // For (2 - size_of_shortest_seq), we'll find and save a repeat of each size, continuing until we're stumped
        // Return the longest that we successfully found in all of the sequences

        // Try one size at a time
        for (int i = 2; (i < size_of_shortest_seq) && !found_the_answer; i++) {
            System.out.println("Trying size: " + i);

            // within the first_seq, grab/test a snippet of that size only until all strings have it
            for (int j = 0; j < first_seq_len - i; j++) {
                String temp_snippet = first_seq.substring(j, j + i);

                // For our current snippet, test whether this is found in all the other strings
                // Try each string. If we have a miss, then break

                boolean is_found_everywhere = true;
                if (DEBUG) {System.out.println("Trying snippet: " + temp_snippet); }

                for (int k = 1; (k < sequence_count) && is_found_everywhere; k++) {

                    System.out.println("Trying string: " + k);
                    String this_seq = list.get(k);

                    int found_at = this_seq.lastIndexOf(temp_snippet);
                    if (found_at >= 0) {
                        if (DEBUG) {System.out.println("Found snippet: " + temp_snippet);}
                    } else {
                        if (DEBUG) {System.out.println("Didn't find snippet: " + temp_snippet);}
                        is_found_everywhere = false;
                        break; // want to confirm that this stops us from going through the other strings
                    }
                }

                // If we made it down here and is_found_everywhere is still true, our snippet was found in every string
                // save it as our winner, break, and continue to next size
                if (is_found_everywhere) {
                    winning_length = i;
                    winning_seq = temp_snippet;
                    if (DEBUG) {System.out.println(temp_snippet + " is a winner");}
                    i++;
                }

                // If we made it all the way to the end of the first string and we didn't find a shared snippet of that
                // size, then we won't improve on our winner
                found_the_answer = true;
            }

        }

        if (DEBUG) {System.out.println("we have: " + sequence_count + " strings:" + list);}

        return winning_seq;
    }
}