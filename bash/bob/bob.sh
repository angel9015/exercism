#!/usr/bin/env bash

is_caps() {
    [[ $1 == "${1^^}" && $1 != "${1,,}" ]]
}

is_question() {
    [[ $1 =~ \?[[:space:]]*$ ]]
}

main () {
        
    if [[ -z ${1//[[:space:]]/} ]]; then
        echo "Fine. Be that way!"
    elif is_caps "$1" && is_question "$1"; then
        echo "Calm down, I know what I'm doing!"
    elif is_caps "$1"; then
        echo "Whoa, chill out!"
    elif  is_question "$1"; then
        echo "Sure."
    else 
        echo "Whatever."
    fi
}

main "$@"
