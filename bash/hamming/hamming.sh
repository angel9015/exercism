#!/usr/bin/env bash

main () {

    if [[ $# != 2 ]]; then
        echo "Usage: hamming.sh <string1> <string2>"
        return 1
    fi

    if [[ -z $1  ]] && [[ -z $2 ]]; then
        echo 0
        return 0
    fi

    if [[ -z $1 ]]; then
        echo "left strand must not be empty"
        return 1
    fi

    if [[ -z $2 ]]; then
        echo "right strand must not be empty"
        return 1
    fi

    if (( ${#1} != ${#2} )); then
        echo "left and right strands must be of equal length"
        return 1
    fi

    idx=0
    cnt=0
    until (( $idx >= ${#1} )); do
        if [[ ${1:$idx:1} != ${2:$idx:1} ]]; then
            ((++cnt))
        fi
        ((idx+=1))
    done
    echo $cnt
}

main "$@"
