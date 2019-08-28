#include "hamming.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int compute(const char *lhs, const char *rhs)
{
    int acc = 0;
    char *lp = (char *)lhs;
    char *rp = (char *)rhs;

    if (lhs == NULL || rhs == NULL)
        return -1;

    while (*lp != 0 || *rp != 0)
    {
        if ((*lp == 0 && *rp != 0) || (*lp != 0 && *rp == 0))
            return -1;
        if (*lp != *rp)
            acc++;

        lp++;
        rp++;
    }
    return acc;
}