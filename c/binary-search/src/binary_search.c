#include "binary_search.h"
#include <stdio.h>

int *binary_search(int value, const int *arr, size_t length)
{
    if (length == 0)
        return NULL;
    int idx = length / 2;
    int middleValue = *(arr + idx);

    if (middleValue == value)
    {
        return (int *)arr + idx;
    }
    else if (middleValue > value)
    {
        return binary_search(value, arr, length / 2);
    }
    else
    {
        return binary_search(value, arr + idx + 1, length / 2);
    }
}