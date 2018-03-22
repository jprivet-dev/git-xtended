#!/usr/bin/env bash

function gbw_test_assert_ok {
    local line=$1
    local message=$2
    local current=$3
    local expected=$4
    #local tab="  ${C_LIGHT_GREEN}|${F_RESET} "
    local tab="  | "

    if [[ "${TEST_GBW_PARAMS_ASSERT_OK_SHOW_MESSAGE}" == 1 ]]; then
        gbw_test_pipeline_message_add_title_ok "${line}"
        gbw_test_pipeline_message_add "${tab}${message}"
        gbw_test_pipeline_message_add "${tab}Current : '${current}'"
        gbw_test_pipeline_message_add "${tab}Expected: '${expected}'"
    fi

    echo -e -n "${C_LIGHT_GREEN}+${F_RESET}"
}

function gbw_test_assert_nok {
    local line=$1
    local message=$2
    local current=$3
    local expected=$4
    #local tab="  ${C_LIGHT_RED}|${F_RESET} "
    local tab="  | "

    gbw_test_pipeline_message_add_title_failure "${line}"
    gbw_test_pipeline_message_add "${tab}${message}"
    gbw_test_pipeline_message_add "${tab}Current : '${current}'"
    gbw_test_pipeline_message_add "${tab}Expected: '${expected}'"

    gbw_test_count_failures_increment

    echo -e -n "${C_BG_RED}${C_WHITE}!${F_RESET}"
}

function gbw_test_assert_equals {
    local current=$1
    local expected=$2
    local line=$3

    if [[ "${current}" == "${expected}" ]]; then
        gbw_test_assert_ok ${line} "Strings are equals" "${current}" "${expected}"
    else
        gbw_test_assert_nok ${line} "Strings are not equals" "${current}" "${expected}"
    fi
}

function gbw_test_assert_last_git_command_is {
    local current="$(gbw_test_fake_git_last_args_check)"
    local expected=$1
    local line=$2

    if [[ "${current}" == "${expected}" ]]; then
        gbw_test_assert_ok ${line} "Last git command is the one expected" "${current}" "${expected}"
    else
        gbw_test_assert_nok ${line} "Last git command is not the one expected" "${current}" "${expected}"
    fi
}

function gbw_test_assert_first_line {
    local current=`echo "${1}" | ${GBW_PARAMS_FILTER_FIRST_LINE}`
    local expected=$2
    local line=$3

    if [[ "${current}" == "${expected}" ]]; then
        gbw_test_assert_ok ${line} "First line is the one expected" "${current}" "${expected}"
    else
        gbw_test_assert_nok ${line} "First line is not the one expected" "${current}" "${expected}"
    fi
}

function gbw_test_assert_second_line {
    local current=`echo "${1}" | head -n2 | tail -n1`
    local expected=$2
    local line=$3

    if [[ "${current}" == "${expected}" ]]; then
        gbw_test_assert_ok ${line} "Second line is the one expected" "${current}" "${expected}"
    else
        gbw_test_assert_nok ${line} "Second line is not the one expected" "${current}" "${expected}"
    fi
}

function gbw_test_assert {
    local type=$1
    shift

    case $type in
        equals)
            gbw_test_assert_equals "$@"
        ;;
        last-git-command-is)
            gbw_test_assert_last_git_command_is "$@"
        ;;
        first-line)
            gbw_test_assert_first_line "$@"
        ;;
        second-line)
            gbw_test_assert_second_line "$@"
        ;;
        *)
            echo -e "${C_LIGHT_RED}[ERROR] Assert type '${type}' does not exist${F_RESET}"
            return
        ;;
    esac

    gbw_test_count_assertions_increment
}

# gbw_test_assert_equals alias
function assert {
    gbw_test_assert "$@"
}

function gbw_test_assert_pipeline_message_print_all {
    if [ ${#gbw_test_assert_pipeline_message[@]} -eq 0 ]; then
        return
    fi

    for line in "${gbw_test_assert_pipeline_message[@]}"; do
        if [[ "${line}" =~ ^-e ]]; then
            echo -e "${line:2}"
        else
            echo "${line}"
        fi
    done

    gbw_test_pipeline_message_clear
}

function gbw_test_pipeline_message_add_title_ok {
    local line=$1
    gbw_test_assert_pipeline_message+=("-e  ${C_LIGHT_GREEN}| ${line}: OK${F_RESET}")
}

function gbw_test_pipeline_message_add_title_failure {
    local line=$1
    gbw_test_assert_pipeline_message+=("-e  ${C_LIGHT_RED}| ${line}: FAILURE${F_RESET}")
}

function gbw_test_pipeline_message_add {
    gbw_test_assert_pipeline_message+=("$1")
}

function gbw_test_pipeline_message_clear {
    gbw_test_assert_pipeline_message=()
}