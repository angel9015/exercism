#include "hamming.h"
#include <stdlib.h>
#include <string.h>

int compute(const char *lhs, const char *rhs)
{
    int acc = 0;
    int i;

    if (lhs == NULL || rhs == NULL)
        return -1;

    if (strlen(lhs) != strlen(rhs))
        return -1;

    for (i = 0; *(i + lhs) != 0; i++)
    {
        if (*(lhs + i) != *(rhs + i))
            acc++;
    }
    return acc;
}