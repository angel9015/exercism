#!/usr/bin/env bash

chr() {
  printf \\$(printf '%03o' $1)
}

ord() {
  printf '%d' "'$1"
}

encode () {
    local text=$1
    local char
    local char_value
    local new_char
    local new_char_value

    for (( i=0; i<${#text}; i++ )); do 
        char="${text:$i:1}"
        char_value=$(ord $char)

        if (( char_value >=97 && char_value <= 97+25 )); then 
            new_char_value=$(( 97 + 97 + 26 - $char_value - 1))
            new_char=$(chr $new_char_value)
            echo -n $new_char
        else
            echo -n $char
        fi

        if (( (i+1) % 5 == 0 && (i+1)<${#text} )); then
            echo -n " "
        fi
        
    done
}

decode () {
    local text=$1
    local char
    local char_value
    local new_char
    local new_char_value

    for (( i=0; i<${#text}; i++ )); do 
        char="${text:$i:1}"
        char_value=$(ord $char)

        if (( char_value >=97 && char_value <= 97+25 )); then 
            char_value=$(( 97 + 97 + 26 - $char_value - 1))
            new_char=$(chr $char_value)
            echo -n $new_char
        else
            echo -n $char
        fi

    done
}


main () {
    local text=${2//[^A-Za-z0-9]/}
    text=${text,,}
    if [[ $1 == "encode" ]]; then
        encode $text;
    fi

    if [[ $1 == "decode" ]]; then
        decode $text;
    fi
    echo
}

main "$@"
