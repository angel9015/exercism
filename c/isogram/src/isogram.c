#include "isogram.h"
#include <ctype.h>
#include <stdio.h>

bool is_isogram(const char phrase[]) {
    if(phrase==NULL) return false;
    int i,j;
    for(i=0;i<strlen(phrase);i++) {
        for(j=i+1;j<strlen(phrase);j++) {
            if(isalpha(phrase[i]) && tolower(phrase[i])==tolower(phrase[j])) {
                return false;
            }
        }
    }
    return true;
}
