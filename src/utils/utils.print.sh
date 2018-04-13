#!/usr/bin/env bash

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

function gbw_print {
    echo "$*"
}

function gbw_print_title_1 {
    gbw_print_colors_force "${C_BG_YELLOW}${C_BLACK}\n\n $*\n${F_RESET}\n"
}

function gbw_print_title_2 {
    gbw_print_colors_force "${C_LIGHT_YELLOW}\n--- $* ---\n${F_RESET}"
}

function gbw_print_title_success {
    gbw_print_colors_force "${C_BG_GREEN}${C_WHITE}\n\n $*\n${F_RESET}\n"
}

function gbw_print_title_error {
    gbw_print_colors_force "${C_BG_RED}${C_WHITE}\n\n $*\n${F_RESET}\n"
}

function gbw_print_step {
    gbw_print_colors_force "> $*"
}

function gbw_print_colors {
    echo ${GBW_PARAMS_PRINT_E_TAG} "$*"
}

function gbw_print_colors_force {
    echo -e "$*"
}

function gbw_print_question_yes_no {
    local choice
    local label="$*"

    while true; do
        echo -e -n "${C_CYAN}>${F_RESET} ${C_BG_CYAN}${C_BLACK} ${label} ${F_RESET}? [y/n] "

        exec < /dev/tty
        read choice

        if [ "${choice}" == "${GBW_PARAMS_Y}" -o "${choice}" == "${GBW_PARAMS_N}" ]; then
            break;
        fi
    done

    if [ "${choice}" == "y" ]; then
        _GBW_PRINT_QUESTION_YES_NO_LAST_VALUE="${GBW_PARAMS_YES}"
        return
    fi

    _GBW_PRINT_QUESTION_YES_NO_LAST_VALUE="${GBW_PARAMS_NO}"
}

function gbw_print_choose_one_option {
    local choice
    local label="$1"
    shift

    local -a options="($*)"
    local count="0"
    local o

    local choice_index
    local choice_label

    local message="${C_CYAN}>${F_RESET} ${C_BG_CYAN}${C_BLACK} ${label} ${F_RESET}"

    for o in "${options[@]}"
    do
        message="${message}  ${C_LIGHT_CYAN}[${count}]${F_RESET} ${o}"
        ((count++))
    done

    echo -e -n "${message}"

    while true; do
        echo -n " : "

        exec < /dev/tty
        read choice_index

        choice_label=""
        count="0"

        for o in "${options[@]}"
        do
            if [[ "${choice_index}" == "${count}" ]]; then
                choice_label="${o}"
            fi
            ((count++))
        done

        if [[ "${choice_label}" != "" ]]; then
            break;
        fi
    done

    _GBW_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE="${choice_label}"

    gbw_print_step "${label} [${_GBW_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}]"
}

