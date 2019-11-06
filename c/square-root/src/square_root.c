#include "square_root.h"

unsigned int squareRoot(unsigned int n) {
    for(unsigned int i=0;i<=n;i++) {
        unsigned int sq = i*i;
        if (sq == n) {
            return i;
        }
        if(sq > n) {
            return 0;
        }
        
    }
    return 0;
}