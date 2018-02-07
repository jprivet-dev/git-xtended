#!/usr/bin/env bash

# Example :
# test_1="hello"
# test_2="bonjour"
# test_3=""
# gbw_implode ', ' 'a' 'b' "$test_1" 3 "$test_2" 4 "$test_3" 5
# a, b, hello, 3, bonjour, 4, 5
function gbw_implode {
    local glue="$1"
    shift
    local -a pieces="($*)"
    local implode=""

    for p in "${pieces[@]}"
    do
        if [[ "$implode" == "" ]]; then
            implode="$p"
        else
            if [[ "$p" != "" ]]; then
                implode="$implode$glue$p"
            fi
        fi
    done

    echo "$implode"
}