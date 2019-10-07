#!/usr/bin/env bash

main () {
    local digits_raw=${1// /}
    
    if (( ${#digits_raw} <= 1 )); then
        echo "false"
        exit 0
    fi

    if [[ $digits_raw =~ [^0-9\ ] ]]; then
        echo "false"
        exit 0
    fi

    local digits=""
    for((i=${#digits_raw}-1;i>=0;i--)); do digits="$digits${digits_raw:$i:1}"; done

    local sum=0
    for (( i=${#digits}-1; i>=0; i-- ));  do  
        local digit=${digits:i:1}
        
        if (( $i % 2 != 0 )); then
            if (( digit < 5 )); then
                sum=$(( sum+digit*2 ))
            else
                sum=$(( sum + (digit*2 -9) ))
            fi
        else
            sum=$(( sum+digit ))
        fi
    done
    
    if (( sum % 10 == 0)); then
        echo "true"
    else
        echo "false"
    fi

}

main "$@"
