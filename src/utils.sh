#!/usr/bin/env bash

# @test
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
        p="$(gbw_trim "$p")"

        if [[ "$implode" == "" ]]; then
            [[ "$p" != "" ]] && implode="$p"
        else
            [[ "$p" != "" ]] && implode="$implode$glue$p"
        fi
    done

    echo "$implode"
}

function gbw_is_bash_interactive {
    [[ $- == *i* ]] \
        && echo "true" \
        || echo "false"
}

# -bash: $'\r': command not found
function gbw_remove_r {
    local file=$1
    sed -i 's/\r$//' $file
}


# TODO : create test
function gbw_trim {
    local string=$1
    echo "$string" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

# TODO : create test
function gbw_echo_fixed_width {
    local width="$1"
    local middle_char="$2"
    local start="$3"
    local end="$4"

    local middle_prefix=" "
    local middle_suffix=" "

    printf -v generator '%*s' "$width"
    local middle=${generator// /$middle_char}

    local count=${#start}+${#end}+${#middle_prefix}+${#middle_suffix}
    local trucate="$middle_prefix${middle:$count}$middle_suffix"

    echo "$start$trucate$end"
}