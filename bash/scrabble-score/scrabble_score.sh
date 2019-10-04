#!/usr/bin/env bash

main () {
    local score=0
    local word=${1^^}
    for (( i=0; i<${#word}; i++ ))
    do  
        local letter=${word:$i:1}
                
        case $letter in
        [DG]*)
            ((score+=2))
            ;;
        [BCMP]*)
            ((score+=3))
            ;;
        [FHVWY]*)
            ((score+=4))
            ;;
        [K]*)
            ((score+=5))
            ;;
        [JX]*)
            ((score+=8))
            ;;
        [QZ]*)
            ((score+=10))
            ;;    
        [AEIOULNRST])
            ((score+=1))
            ;;
        esac
    done
    echo "$score"
}

main "$@"
