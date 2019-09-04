#include "beer_song.h"
#include <stdio.h>
#include <string.h>

#define EMPTY_VERSE "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
#define VERSE "%d bottle%s of beer on the wall, %d bottle%s of beer.\nTake %s down and pass it around, %s bottle%s of beer on the wall.\n"

void verse(char *buffer, unsigned int verse_number)
{
    if (verse_number == 0)
    {
        sprintf(buffer, EMPTY_VERSE);
    }
    else
    {
        char b[25];
        sprintf(b, "%d", verse_number - 1);
        sprintf(buffer, VERSE,
                verse_number,
                verse_number != 1 ? "s" : "",
                verse_number,
                verse_number != 1 ? "s" : "",
                verse_number == 1 ? "it" : "one",
                verse_number == 1 ? "no more" : b,
                verse_number != 2 ? "s" : "");
    }
}

void sing(char *buffer, unsigned int starting_verse_number, unsigned int ending_verse_number)
{
    unsigned int bufIdx = 0;
    unsigned int verse_num;
    for (verse_num = starting_verse_number; verse_num >= ending_verse_number; verse_num--)
    {
        verse(buffer + bufIdx, verse_num);
        bufIdx = strlen(buffer);
        if (verse_num > ending_verse_number)
        {
            buffer[bufIdx++] = '\n';
            buffer[bufIdx] = 0;
        }
        if (verse_num == 0)
        {
            break;
        }
    }
    //sprintf(buffer, "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.", starting_verse_number, ending_verse_number, starting_verse_number - 1);
}