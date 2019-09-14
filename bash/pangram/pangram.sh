#!/usr/bin/env bash


main () {
    # Remove non-alpha characters
    # Covert to lowercase
    # Put each character in a separate line
    # Sort unique the characters
    # Join again the lines
    # And check if we have the full alphabet
    output=`echo $1 | tr -cd '[:alpha:]' | tr '[:upper:]' '[:lower:]' | fold -w1 | sort -u | tr -d \\n`
    echo $output
    if [[ $output == 'a b c d e f g h i j k l m n o p q r s t u v w x y z' ]]; then
        echo "true"
    else
        echo "false"
    fi;
}

main2 () {
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
