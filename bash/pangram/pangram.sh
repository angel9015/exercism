#!/usr/bin/env bash


main () {
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

main "$@"
