#!/usr/bin/env bash

# Example :
# test_1="hello"
# test_2="bonjour"
# test_3=""
# gbw_implode ', ' 'a' 'b' "$test_1" 3 "$test_2" 4 "$test_3" 5
# a, b, hello, 3, bonjour, 4, 5
function gbw_implode {
    local glue="$1"
    local current_glue=""
    shift

    local -a pieces="($*)"
    local implode=""

    for p in "${pieces[@]}"
    do
        [[ "$implode" == "" ]] && current_glue="" || current_glue="$glue"
        [[ "$p" != "" ]] && implode="$implode$current_glue$p"
    done

    echo "$implode"
}

function gbw_is_bash_interactive {
    [[ $- == *i* ]] && echo "true" || echo "false"
}

# -bash: $'\r': command not found
function gbw_remove_r {
    local file=$1
    sed -i 's/\r$//' $file
}