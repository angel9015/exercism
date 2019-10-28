#!/usr/bin/env bash

chr() {
  printf \\$(printf '%03o' $1)
}

ord() {
  printf '%d' "'$1"
}

encdec_int () {
    local text=$1
    local i=$2
    local char
    local char_value
    local new_char_value
    local -ri ascii_a=97
    local -ri ascii_z=$((97 + 25))

    char="${text:$i:1}"
    char_value=$(ord $char)

    if (( char_value >= ascii_a && char_value <= ascii_z )); then
        new_char_value=$(( ascii_a + ascii_z - $char_value ))
        chr $new_char_value
    else
        echo -n $char
    fi
}

encode () {
    local text=$1
    for (( i=0; i<${#text}; i++ )); do
        encdec_int $text $i
        if (( (i+1) % 5 == 0 && (i+1)<${#text} )); then
            echo -n " "
        fi

    done
}

decode () {
    local text=$1
    for (( i=0; i<${#text}; i++ )); do
        encdec_int $text $i

    done
}


main () {
    local text=${2//[^[:alnum:]]/}
    text=${text,,}
    if [[ $1 == "encode" || $1 == decode ]]; then
        $1 $text;
    fi

    echo
}

main "$@"
