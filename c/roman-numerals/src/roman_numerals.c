#include "roman_numerals.h"
#include <stdlib.h>

char *to_roman_numeral(unsigned int number)
{
    char *buf = malloc(256 * sizeof(char));
    int idx = 0;
    while (number > 0)
    {
        if (number >= 1000)
        {
            buf[idx++] = 'M';
            number -= 1000;
        }
        else if (number >= 900)
        {
            buf[idx++] = 'C';
            buf[idx++] = 'M';
            number -= 900;
        }
        else if (number >= 500)
        {
            buf[idx++] = 'D';
            number -= 500;
        }
        else if (number >= 400)
        {
            buf[idx++] = 'C';
            buf[idx++] = 'D';
            number -= 400;
        }
        else if (number >= 100)
        {
            buf[idx++] = 'C';
            number -= 100;
        }
        else if (number >= 90)
        {
            buf[idx++] = 'X';
            buf[idx++] = 'C';
            number -= 90;
        }
        else if (number >= 50)
        {
            buf[idx++] = 'L';
            number -= 50;
        }
        else if (number >= 40)
        {
            buf[idx++] = 'X';
            buf[idx++] = 'L';
            number -= 40;
        }
        else if (number >= 10)
        {
            buf[idx++] = 'X';
            number -= 10;
        }
        else if (number >= 9)
        {
            buf[idx++] = 'I';
            buf[idx++] = 'X';
            number -= 9;
        }
        else if (number >= 5)
        {
            buf[idx++] = 'V';
            number -= 5;
        }
        else if (number >= 4)
        {
            buf[idx++] = 'I';
            buf[idx++] = 'V';
            number -= 4;
        }
        else if (number >= 1)
        {
            buf[idx++] = 'I';
            number--;
        }
    }
    buf[idx] = 0;
    return buf;
}
