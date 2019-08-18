#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "word_count.h"

int word_count(const char *input_text, word_count_word_t *words)
{
    unsigned int i, j;
    memset(words, 0, MAX_WORDS * sizeof(word_count_word_t));
    char current_word[MAX_WORD_LENGTH + 1];
    unsigned int current_word_idx = 0;
    unsigned int words_length = 0;
    for (i = 0; i < strlen(input_text) + 1; i++)
    {
        if (isalpha(input_text[i]) || isdigit(input_text[i]) || (input_text[i] == '\'' && input_text[i - 1] != ' ' && input_text[i + 1] != ' '))

        {
            current_word[current_word_idx++] = tolower(input_text[i]);
            if (current_word_idx > MAX_WORD_LENGTH)
            {
                return EXCESSIVE_LENGTH_WORD;
            }
        }
        else
        {
            if (current_word_idx == 0)
                continue;
            current_word[current_word_idx] = 0;
            current_word_idx = 0;

            int word_found = 0;
            for (j = 0; j < words_length; j++)
            {
                if (strcmp(words[j].text, current_word) == 0)
                {
                    words[j].count++;
                    word_found = 1;
                }
            }
            if (word_found == 0)
            {
                if (words_length == MAX_WORDS)
                {
                    return EXCESSIVE_NUMBER_OF_WORDS;
                }
                strcpy(words[words_length].text, current_word);
                words[words_length].count = 1;
                words_length++;
            }
        }
    }

    return words_length;
}