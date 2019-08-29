#include "grains.h"

uint64_t square(uint8_t index)
{
    if (index > 64 || index < 1)
        return 0;
    if (index == 1)
        return 1ull;
    return 2 * square(index - 1);
}

uint64_t total(void)
{
    return 2 * square(64) - 1;
}