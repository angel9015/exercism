#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>

int ipow(int b, int p) {
    return (int)pow((double)b, (double)p);
}

int isArmstrongNumber(int num) {
    int tmp_num = num;
    int digit_counter = 0;
    int acc = 0;

    while(tmp_num != 0) {
        tmp_num /= 10;
        ++digit_counter;
    }

    tmp_num = num;
    while(tmp_num > 0) {
        int rem = tmp_num % 10;
        tmp_num /= 10;
        acc += ipow(rem, digit_counter);
    };
    return(num == acc);
}
