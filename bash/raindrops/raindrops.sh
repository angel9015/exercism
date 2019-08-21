#!/usr/bin/env bash


main () {
    out=""
    if (( $1 % 3 == 0 ))
    then
        out="Pling"
    fi

    if (( $1 % 5 == 0 ))
    then
        out+="Plang"
    fi

    if (( $1 % 7 == 0 ))
    then
        out+="Plong"
    fi

    if [[ -z $out ]]
    then
        echo $1
    else
        echo $out
    fi
}

main "$@"
