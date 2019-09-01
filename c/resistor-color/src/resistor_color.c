#include "resistor_color.h"

int colorCode(resistor_band_t cc)
{
    return (int)cc;
}

resistor_band_t *colors()
{
    static resistor_band_t c[] = {
        BLACK, BROWN, RED, ORANGE, YELLOW,
        GREEN, BLUE, VIOLET, GREY, WHITE};
    return c;
}