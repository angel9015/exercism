#include "binary_search.h"
#include <stdio.h>

int *binary_search(int value, const int *arr, size_t length)
{
    size_t len = length;
    int *start = (int *)arr;
    while (len > 0)
    {
        size_t idx = len / 2;
        int middleValue = *(start + idx);
        if (middleValue == value)
        {
            return start + idx;
        }
        else if (middleValue > value)
        {
            len /= 2;
        }
        else
        {
            start = (int *)start + idx + 1;
            len /= 2;
        }
    }
    return NULL;
}

/*
int *binary_search_recursive(int value, const int *arr, size_t length)
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
}*/