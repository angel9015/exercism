#include "difference_of_squares.h"
#include <math.h>

unsigned int ipow(unsigned int b, unsigned int p)
{
    return (int)pow((double)b, (double)p);
}

unsigned int sum_of_squares(unsigned int number)
{
    unsigned int i = 0;
    unsigned int s = 0;
    for (i = 1; i <= number; i++)
    {
        s += ipow(i, 2);
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
    return ipow(s, 2);
}

unsigned int difference_of_squares(unsigned int number)
{
    return square_of_sum(number) - sum_of_squares(number);
}