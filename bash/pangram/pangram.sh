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

main () {
    input=${1,,}
    is_pangram=1
    for char_to_check in {a..z}; do
        if [[ ! $input =~ $char_to_check ]]; then
            is_pangram=0
            break
        fi
    done

    if (( $is_pangram == 1 )); then
        echo "true"
    else
        echo "false"
    fi;

}

main "$@"
