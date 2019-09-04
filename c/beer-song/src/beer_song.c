#include "beer_song.h"
#include <stdio.h>

void verse(char *buffer, unsigned int verse_number) {
    sprintf(buffer, "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n", verse_number, verse_number, verse_number-1);
}

void sing(char *buffer, unsigned int starting_verse_number, unsigned int ending_verse_number) {
    sprintf(buffer, "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.", starting_verse_number, ending_verse_number, starting_verse_number-1);  
}