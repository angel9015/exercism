#!/usr/bin/env bash

is_caps() {
    if [[ $1 == ${1^^} && $1 != ${1,,} ]]; then
        return 0
    else
        return 1
    fi
}

is_question() {
    if [[ $1 =~ \?[[:space:]]*$ ]]; then
        return 0
    else
        return 1
    fi
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
