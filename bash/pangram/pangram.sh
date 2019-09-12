#!/usr/bin/env bash


main2 () {
    # Remove non-alpha characters
    # Covert to lowercase
    # Put each character in a separate line
    # Sort the characters
    # Get 1 of each character
    # Join again the lines
    # And check if we have the full alphabet
    output=`echo $1 | tr -cd '[:alpha:]' | tr '[:upper:]' '[:lower:]' | fold -w1 | sort | uniq | awk '{print}' ORS=''`
    if [[ $output == 'abcdefghijklmnopqrstuvwxyz' ]]; then
        echo "true"
    else
        echo "false"
    fi;
}


ALL_CHARS="abcdefghijklmnopqrstuvwxyz"

main () {
    input="$1"
    is_pangram=1
    for (( i = 0; i < ${#ALL_CHARS}; i++ )); do
        char_to_check=${ALL_CHARS:$i:1}
        char_found=0
        for (( j = 0; j < ${#input}; j++ )); do
            char=${input:$j:1}
            char=${char,}
            if [[ $char == $char_to_check ]]; then
                char_found=1
                break
            fi;
        done
        if [[ $char_found -eq 0 ]]; then
            is_pangram=0
            break
        fi;
    done

    if [[ $is_pangram -eq 1 ]]; then
        echo "true"
    else
        echo "false"
    fi;

}

main "$@"
