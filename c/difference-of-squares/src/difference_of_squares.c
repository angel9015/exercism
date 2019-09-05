#include "difference_of_squares.h"
#include <math.h>

unsigned int sq(unsigned int a)
{
    return a * a;
}

unsigned int sum_of_squares(unsigned int number)
{
    unsigned int i = 0;
    unsigned int s = 0;
    for (i = 1; i <= number; i++)
    {
        s += sq(i);
    }
    return s;
}

unsigned int square_of_sum(unsigned int number)
{
    unsigned int i = 0;
    unsigned int s = 0;
    for (i = 1; i <= number; i++)
    {
        s += i;
    }
    return sq(s);
}

unsigned int difference_of_squares(unsigned int number)
{
    return square_of_sum(number) - sum_of_squares(number);
}