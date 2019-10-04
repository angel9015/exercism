#!/usr/bin/env bash

main () {
    if [[ $1 == "total" ]]; then
        echo "2^64-1" | bc -l
    elif (( $1 < 1 || $1 > 64)); then
        echo "Error: invalid input"
        return 1
    
    else
        echo "2^($1-1)" | bc -l
    fi
}

main "$@"
