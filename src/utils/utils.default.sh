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
        p="`gbw_trim "${p}"`"

        if [[ "${implode}" == "" ]]; then
            [[ "${p}" != "" ]] && implode="${p}"
        else
            [[ "${p}" != "" ]] && implode="${implode}${glue}${p}"
        fi
    done

    echo "${implode}"
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

function gbw_trim {
    local string=$1
    echo "${string}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

function gbw_regex_remove_colors {
    echo "$1" | sed -E 's/\\e\[[0-9]{1,3}m//g'
}

function gbw_line_generator {
    local length=$1
    local symbol=$2
    local result

    printf -v generator '%*s' "${length}"
    result=${generator// /$symbol}

    echo "${result}"
}

function gbw_regex_extract_version {
    echo "$1" | sed -e 's/^.*[^0-9]\([0-9]\+.[0-9]\+.[0-9]\+\).*$/\1/'
}

function gbw_is_good_version {
    local current_major
    local current_minor
    local current_patch
    IFS="." read current_major current_minor current_patch <<< "${1}"

    local target_major
    local target_minor
    local target_patch
    IFS="." read target_major target_minor target_patch <<< "${2}"

    if [[ "${current_major}" < "${target_major}" ]]; then
        echo "${GBW_PARAMS_FALSE}"
        return
    fi

    if [[ "${current_minor}" < "${target_minor}" ]]; then
        echo "${GBW_PARAMS_FALSE}"
        return
    fi

    if [[ "${current_patch}" < "${target_patch}" ]]; then
        echo "${GBW_PARAMS_FALSE}"
        return
    fi

    echo "${GBW_PARAMS_TRUE}"
}