#!/usr/bin/env bash

function gbw_tests_assert_ok {
    local message=$1
    local line=$2
    local color="$C_LIGHT_GREEN"

    echo -e "$color$line: OK$F_RESET"
    echo "$message"
}

function gbw_tests_assert_nok {
    local message=$1
    local line=$2
    local color="$C_LIGHT_RED"

    echo -e "$color$line: FAILURE$F_RESET"
    echo "$message"

    gbw_tests_count_failures_increment
}

function gbw_tests_assert_equals {
    local current=$1
    local expected=$2
    local line=$3

    if [[ "$current" == "$expected" ]]; then
        gbw_tests_assert_ok "$current equals $expected" $line
    else
        gbw_tests_assert_nok "$current not equals $expected" $line
    fi
}

function gbw_tests_assert {
    local type=$1
    shift

    case $type in
        equals)
            gbw_tests_assert_equals "$@"
        ;;
        *)
            echo "Unknow assert type '$type'"
            return
        ;;
    esac

    gbw_tests_count_assertions_increment
}

# gbw_tests_assert_equals alias
function assert {
    gbw_tests_assert "$@"
}