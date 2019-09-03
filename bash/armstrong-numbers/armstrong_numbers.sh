#!/usr/bin/env bash

main () {
    tmp_num=$1
    acc=0

    until (( $tmp_num == 0 )); do
        rem=$((tmp_num % 10));
        tmp_num=$((tmp_num / 10));
        acc=$((acc + rem ** ${#1}));
    done

    if (( $acc == $1 )); then
        echo "true"
    else
        echo "false"
    fi

}

main "$@"
