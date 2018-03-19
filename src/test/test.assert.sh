#!/usr/bin/env bash

function gbw_test_assert_ok {
    local line=$1
    local message=$2
    local current=$3
    local expected=$4
    #local tab="  ${C_LIGHT_GREEN}|${F_RESET} "
    local tab="  | "

    if [[ "$GBW_PARAMS_TEST_ASSERT_OK_SHOW_MESSAGE" == 1 ]]; then
        gbw_test_pipeline_message_add_title_ok "$line"
        gbw_test_pipeline_message_add "${tab}$message"
        gbw_test_pipeline_message_add "${tab}Current : '$current'"
        gbw_test_pipeline_message_add "${tab}Expected: '$expected'"
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

    gbw_test_pipeline_message_add_title_failure "$line"
    gbw_test_pipeline_message_add "${tab}$message"
    gbw_test_pipeline_message_add "${tab}Current : '$current'"
    gbw_test_pipeline_message_add "${tab}Expected: '$expected'"

    gbw_test_count_failures_increment

    echo -e -n "${C_BG_RED}${C_WHITE}!${F_RESET}"
}

function gbw_test_assert_equals {
    local current=$1
    local expected=$2
    local line=$3

    if [[ "$current" == "$expected" ]]; then
        gbw_test_assert_ok $line "Strings are equals" "$current" "$expected"
    else
        gbw_test_assert_nok $line "Strings are not equals" "$current" "$expected"
    fi
}

function gbw_test_assert {
    local type=$1
    shift

    case $type in
        equals)
            gbw_test_assert_equals "$@"
        ;;
        *)
            echo "Unknow assert type '$type'"
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
        if [[ "$line" =~ ^-e ]]; then
            echo -e "${line:2}"
        else
            echo "$line"
        fi
    done

    gbw_test_pipeline_message_clear
}

function gbw_test_pipeline_message_add_title_ok {
    local line=$1
    gbw_test_assert_pipeline_message+=("-e  ${C_LIGHT_GREEN}| $line: OK${F_RESET}")
}

function gbw_test_pipeline_message_add_title_failure {
    local line=$1
    gbw_test_assert_pipeline_message+=("-e  ${C_LIGHT_RED}| $line: FAILURE${F_RESET}")
}

function gbw_test_pipeline_message_add {
    gbw_test_assert_pipeline_message+=("$1")
}

function gbw_test_pipeline_message_clear {
    gbw_test_assert_pipeline_message=()
}