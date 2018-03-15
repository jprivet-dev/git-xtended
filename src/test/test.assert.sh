#!/usr/bin/env bash

function gbw_test_assert_ok {
    local message=$1
    local line=$2
    local color="$C_LIGHT_GREEN"

#    echo -e "$color| $line: OK$F_RESET "
    echo -e -n "${C_LIGHT_GREEN}+${F_RESET}"

    if [[ "$GBW_PARAMS_TEST_ASSERT_OK_SHOW_MESSAGE" == 0 ]]; then
        return
    fi

    echo "$message"
}

function gbw_test_assert_nok {
    local message=$1
    local line=$2

    gbw_test_assert_pipeline_failures+=("${C_LIGHT_RED}| $line: FAILURE${F_RESET}")
    gbw_test_assert_pipeline_failures+=("  $message")

    echo -e -n "${C_BG_RED}${C_WHITE}!${F_RESET}"

    gbw_test_count_failures_increment
}

function gbw_test_assert_equals {
    local current=$1
    local expected=$2
    local line=$3

    if [[ "$current" == "$expected" ]]; then
        gbw_test_assert_nok "Strings are equals\n  Current : '$current'\n  Expected: '$expected'" $line
    else
        gbw_test_assert_nok "Strings are not equals\n  Current : '$current'\n  Expected: '$expected'" $line
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

function gbw_test_assert_pipeline_failures_print_all {
    if [ ${#gbw_test_assert_pipeline_failures[@]} -eq 0 ]; then
        return
    fi

    for line in "${gbw_test_assert_pipeline_failures[@]}"; do
      echo -e "$line"
    done
    gbw_test_assert_pipeline_failures=()
}