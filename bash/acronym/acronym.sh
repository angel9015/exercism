#!/usr/bin/env bash


main () {
    idx=0
    cnt=0
    #echo ${1^}
    letter=${1:0:1}
    letters=${letter^}
    
    until (( $idx >= ${#1} )); do
        #echo ${1:$idx+1:1}
        if [[ ${1:$idx:1} == " " || ${1:$idx:1} == "-" || ${1:$idx:1} == "_" ]]; then
            letter=${1:$idx+1:1}
            if [[ $letter =~ [[:alpha:]] ]]; then
                letters+=${letter^}
                ((idx+=1))
            fi
        fi
        ((idx+=1))
    done

    echo $letters
}


main "$@"

