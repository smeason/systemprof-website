
// Start your file with directives (pre-processor commands)
#include <stdio.h>
// This directive tells the complier that we want to link the standard
// input/ouput library




int main(int argc, char **argv) {
    // int main(void) or int main() would work as well since no arguments are required

    // this is the function body, statements go here
    // need ; to end lines


    int age;
    printf("Enter age\n");
    scanf("%d", &age);
    printf("hello world\n");
    return 0;
}

// can also run using command line (windows powershell)

// variable types
// have different format specifiers
// e.g. display 2 decimal places --> %.2f
