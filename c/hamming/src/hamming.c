#include "hamming.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int compute(const char *lhs, const char *rhs)
{
    int acc = 0;

    if (lhs == NULL || rhs == NULL)
        return -1;

    while (*lhs != 0 || *rhs != 0)
    {
        if ((*lhs == 0 && *rhs != 0) || (*lhs != 0 && *rhs == 0))
            return -1;
        if (*lhs++ != *rhs++)
            acc++;
    }
    return acc;
}