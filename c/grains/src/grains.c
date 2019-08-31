#include "grains.h"

uint64_t square(uint8_t index)
{
    if (index > 64 || index < 1)
        return 0;
    if (index == 1)
        return 1ull;
    return 1ull << (index - 1);
}

uint64_t total(void)
{
    return square(64) + (square(64) - 1);
}