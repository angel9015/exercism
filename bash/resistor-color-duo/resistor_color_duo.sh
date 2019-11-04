#!/usr/bin/env bash

main() {
   
    declare -iA colors
    colors[black]=0
    colors[brown]=1
    colors[red]=2
    colors[orange]=3
    colors[yellow]=4
    colors[green]=5
    colors[blue]=6
    colors[violet]=7
    colors[grey]=8
    colors[white]=9
    
    if [[ "$#" -lt 2 ]]; then
        echo "invalid color"
        return 1
    fi

    local c1=$1
    local c2=$2


    if [[ ${colors[c1]}+1 == "1" || ${colors[c2]}+2  == "2" ]]; then
        echo "invalid color"
        return 1
    else
        echo "${colors[$c1]}${colors[$c2]}"
    fi
}

main "$@"
