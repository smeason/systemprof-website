#include <stdio.h>

// note, always assign a value to a variable when you intiailize it
int main() {
    int small_num = 42, overflow_test;
    char a_letter = 'c';
    int unpredictable_num;

    // Printing integers and characters
    printf("The value of small_num is: %d\n", small_num); // d is for formatting/printing as an integer
    prinf("we can print small_num as a chracter: %c\n\n", small_num); // c is for formatting/printing as a char

    printf("Let's print a_letter: %c\n", a_letter);
    printf("We can print a_letter as an integer: %d\n\n", a_letter);

    // Overflow example - avoid this!
    overflow_test = 123456789123456789;
    printf("The value stored in overflow_test is %d\n", overflow_test);

    // The value of predictable_num can vary if we don't assign a value
    printf("unpredictable_num is: %d\n\n", unpredictable_num);

    // integer and floating point casting
    small_num = 42.9999;
    printf("Implicit casting (float value to int variable) - small_num is %d\n", small_num);


    // control number of decmial places printed
    printf("42.9999 printed to 2 decimal places is: %.2f\n", 42.9999);


    return 0;
}