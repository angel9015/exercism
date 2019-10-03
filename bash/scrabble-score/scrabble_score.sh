#!/usr/bin/env bash

main () {
    score=0
    word=${1^^}
    for (( i=0; i<${#word}; i++ ))
    do  
        letter=${word:$i:1}
                
        case $letter in
        [D,G]*)
            ((score+=2))
            ;;
        [B,C,M,P]*)
            ((score+=3))
            ;;
        [F,H,V,W,Y]*)
            ((score+=4))
            ;;
        [K]*)
            ((score+=5))
            ;;
        [J,X]*)
            ((score+=8))
            ;;
        [Q,Z]*)
            ((score+=10))
            ;;    
        *)
            ((score+=1))
            ;;
        esac
        #echo $letter
    done
    echo $score
}

main "$@"
