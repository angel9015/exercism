#!/usr/bin/env bash


main () {
    idx=0
    letter=${1:0:1}
    if [[ $letter =~ [[:alpha:]] ]]; then
        letters=${letter^}
    fi

    until (( $idx >= ${#1} )); do
        if [[ ${1:idx:1} == [" "_-] ]]; then
            letter=${1:idx+1:1}
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

