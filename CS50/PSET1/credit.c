/**
 * credit.c
 * 
 * Diane Kaplan
 * dianekaplan@gmail.com
 * 
 * Prompt the user for a credit card number, check valid vs invalid, and report the verdict
 * */
 
 
#include <cs50.h>
#include <stdio.h>

// prototypes
long long GetCard(void);
bool CheckSum(long long);
string GetCardType(long long card);


int main(void)
{
    string verdict; 
    
    // Prompt the user for a credit card number (see function below)
    long long card_num = GetCard();
    
    // Run checksum, and if it passes then check the card type
    if (CheckSum(card_num) == true)
    {
        verdict = GetCardType(card_num);
    }
    else
        {
        verdict = "INVALID";
    }
    
    // Output our result
    printf("%s\n", verdict); 
    
    return 0;
}

/**
 * Prompt the user for a credit card number
 */
long long GetCard()
{
    long long card_num; 
    
    // Card length should be 13-16 digits so I started with a do/while loop
    // Commenting that out since 'check' wants to see 1234567890 go through and get evaluated as INVALID
    // do
    // {
        printf("Number: ");
        card_num = GetLongLong();
    // }
    // while ( card_num < 4000000000000  || card_num > 5600000000000000 );  

    return card_num;
}

/**
 * Run the checksum test on a card number
 * Multiply every other digit by 2, starting with the number’s second-to-last digit, and then add those products' digits together.
 * Add the sum to the sum of the digits that weren’t multiplied by 2.
 * If the total’s last digit is 0 (or, put more formally, if the total modulo 10 is congruent to 0), the number is valid!
 */
bool CheckSum(long long card)
{
    //I got the idea to go digit by digit via modulus and dividing by 10 from stack overflow (from searching how to iterate through the digits of a long long)
    long long sum_of_doubled_digits_numbers = 0;
    long long sum_of_other_digits = 0;
    long long grand_total = 0;
        
    int digit_counter = 0;
    
    while ( card > 0 )
    {
        // use modulo to get the right-most digit
        int this_digit = card%10;
        
        // the first digit (and every other from there) gets summed together
        if (digit_counter%2 == 0)
            { 
                sum_of_other_digits = sum_of_other_digits + this_digit; 
            }


        // the alternating digits do something fancier: double it, add THOSE digits if the value's >= 10, and add to running total of those doubles
        else 
            { 
            int doubled_value = 2 * this_digit;
            
            if ( doubled_value < 10 )
                {
                    sum_of_doubled_digits_numbers += doubled_value;
                }
            else // doubling it gives us a value between 10 - 18, so we need to add 1 + the last digit
                {
                    int last_digit_of_doubled_value = (doubled_value % 10);
                    
                    sum_of_doubled_digits_numbers += 1;
                    sum_of_doubled_digits_numbers += last_digit_of_doubled_value;
                }
            }
        
        // Proceed to the next digit by dividing by 10, and increment digit_counter 
        card = card/10;
        digit_counter++;
    }

    //  Then add the two sums together, and we're valid if the last digit is 0
    grand_total = sum_of_doubled_digits_numbers + sum_of_other_digits;
    if ( grand_total % 10 == 0 )
        return true;
    else
        return false;
}


/**
* Check what type of credit card this is: 
* American Express numbers all start with 34 or 37
* MasterCard numbers all start with 51, 52, 53, 54, or 55
* Visa numbers all start with 4 
 */
 
string GetCardType(long long card)
{
    string result;
    
    // First, grab the first two digits by repeatedly dividing by 10
    while (card > 100)
        {
        card = card/10;
        }
        
    // Then check those digits based on rules above
    if ( card > 39 && card < 50)
        result = "VISA";
    else if ( card == 34 || card == 37 )
        result = "AMEX";
    else if ( card > 50 && card < 56)
        result = "MASTERCARD";
    else 
        result = "INVALID";
    return result;
}
