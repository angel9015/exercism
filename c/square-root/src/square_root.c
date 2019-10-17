#include "square_root.h"

unsigned int squareRoot(unsigned int n) {
    unsigned int i;
    for(i=0;i<=n;i++) {
        if (i*i == n) {
            return i;
        }
    }
    return 0;
}