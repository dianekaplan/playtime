package rosalind;

/**
 * Created by Diane on 10/9/2016.
 # Rosalind Problem: inheritance (iprb)
 # http://rosalind.info/problems/iprb/
 # First in python Aug 2, 2015, adapted to Java Oct 9, 2016

 # Rules:
 # Given: Three positive integers k, m, and n, representing a population containing k+m+n organisms:
 # k individuals are homozygous dominant for a factor, m are heterozygous, and n are homozygous recessive.

 # Return: The probability that two randomly selected mating organisms will produce an individual possessing a dominant allele
 # (and thus displaying the dominant phenotype). Assume that any two organisms can mate.

 # That's the same as the probability that we got a dominant allele from one of the two parents
 */
public class iprb {

    public static void main(String[] args) {

        int homo_dom = 15;
        int hetero = 17;
        int homo_rec = 25;

        System.out.println(prob_of_offspring_having_dominant(homo_dom, hetero, homo_rec));
    }


    protected static double prob_of_offspring_having_dominant(int k, int m, int n) {
        // k individuals are homozygous dominant for a factor, m are heterozygous, and n are homozygous recessive.

        boolean DEBUG = false;

        double homo_dom_count, hetero_count, homo_rec_count, total_count;

        homo_dom_count = k;
        hetero_count = m;
        homo_rec_count = n;

        total_count = homo_dom_count + hetero_count + homo_rec_count;

        //  Calc the odds of getting a dominant letter from one of the two chosen parents
        //   0) Summary text shows adding the probabilities for the different ways it can happen

        double P_homo_dom_first, P_hetero_first, P_hetero_then_homo_dom, P_hetero_hetero_special, P_homo_rec_first;
        double P_homo_rec_then_homo_dom, P_homo_rec_then_hetero, prob_one_parent_homo_dom;


        //   a) first is homo dom (TBD%), second is anything (100%)
        P_homo_dom_first = homo_dom_count/total_count;

        //   b) first is hetero, then...
        P_hetero_first = hetero_count/total_count; //#won't add directly

       //    b1)...second is homo dom
        P_hetero_then_homo_dom = P_hetero_first * (homo_dom_count/(total_count-1));
       //   b2) ...second is hetero, and their offspring gets one of the dominant alleles
        P_hetero_hetero_special = P_hetero_first * ((hetero_count-1)/(total_count-1))*(0.75);

       // c) first is homo rec, then...
        P_homo_rec_first = homo_rec_count/total_count;

       //c1) ...second is homo dominant
        P_homo_rec_then_homo_dom = P_homo_rec_first * (homo_dom_count/(total_count-1));
         //c2) ...second is hetero
        P_homo_rec_then_hetero = P_homo_rec_first * (hetero_count/(total_count-1));

        prob_one_parent_homo_dom = P_homo_dom_first + P_hetero_then_homo_dom + P_hetero_hetero_special + P_homo_rec_then_homo_dom + P_homo_rec_then_hetero;

        if (DEBUG) {
            System.out.println("P_homo_dom_first:" + P_homo_dom_first);
            System.out.println("P_hetero_then_homo_dom:" + P_hetero_then_homo_dom);
            System.out.println("P_hetero_hetero_special:" + P_hetero_hetero_special);
            System.out.println("P_homo_rec_then_homo_dom:" + P_homo_rec_then_homo_dom);
            System.out.println("P_homo_rec_then_hetero:" + P_homo_rec_then_hetero);
        }

        return prob_one_parent_homo_dom;

    }

}
