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

function gbw_print_fixed_width {
    local e="${GBW_PARAMS_OFF}"
    local width middle_char start end
    local start_no_style end_no_style
    local middle_prefix middle_suffix
    local middle trucate count

    if [ "$1" == "-e" ]; then
        e="${GBW_PARAMS_ON}"
        shift
    fi

    width="$1"
    middle_char="$2"
    start="$3"
    end="$4"
    [ "$5" != "" ] && middle_prefix="$5"
    [ "$6" != "" ] && middle_suffix="$6"

    if [ "${e}" == "${GBW_PARAMS_ON}" ]; then
        start_no_style=`gbw_regex_remove_colors "${start}"`
        end_no_style=`gbw_regex_remove_colors "${end}"`
    else
        start_no_style="${start}"
        end_no_style="${end}"
    fi

    middle=`gbw_line_generator "${width}" "${middle_char}"`
    count=${#start_no_style}+${#end_no_style}+${#middle_prefix}+${#middle_suffix}
    trucate="${middle_prefix}${middle:$count}${middle_suffix}"

    if [ "${e}" == "${GBW_PARAMS_ON}" ]; then
        echo -e "${start}${trucate}${end}"
        return
    fi

    echo "${start}${trucate}${end}"
}

function gbw_line_generator {
    local length=$1
    local symbol=$2
    local result

    printf -v generator '%*s' "${length}"
    result=${generator// /$symbol}

    echo "${result}"
}

function gbw_print {
    echo "$*"
}

function gbw_print_title_1 {
    local line_info=" $* "
    local col_width=${#line_info}
    local space=" "

    gbw_print
    gbw_print_fixed_width -e $col_width "${space}" "${C_BLACK}${C_BG_LIGHT_YELLOW}"                 "${F_RESET}"
    gbw_print_fixed_width -e $col_width "${space}" "${C_BLACK}${C_BG_LIGHT_YELLOW}${line_info}"     "${F_RESET}"
    gbw_print_fixed_width -e $col_width "${space}" "${C_BLACK}${C_BG_LIGHT_YELLOW}"                 "${F_RESET}"
    gbw_print
}

function gbw_print_title_2 {
    local line_info="| $* |"
    local col_width=${#line_info}

    gbw_print
    gbw_print_fixed_width -e $col_width "-" "${C_LIGHT_YELLOW}"                 "${F_RESET}" "+" "+"
    gbw_print_fixed_width -e $col_width " " "${C_LIGHT_YELLOW}${line_info}"     "${F_RESET}"
    gbw_print_fixed_width -e $col_width "-" "${C_LIGHT_YELLOW}"                 "${F_RESET}" "+" "+"
    gbw_print
}

function gbw_print_step {
    gbw_print_colors_force "${C_LIGHT_YELLOW}> $*${F_RESET}"
}

function gbw_print_colors {
    echo ${GBW_PARAMS_PRINT_E_TAG} "$*"
}

function gbw_print_colors_force {
    echo -e "$*"
}