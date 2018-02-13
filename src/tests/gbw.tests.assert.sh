#!/usr/bin/env bash

function gbw_tests_assert_equals {
    if [[ "$1" == "$2" ]]; then
        echo "$3: $GBW_TRUE [ $1 ] equals [ $2 ]"
    else
        echo "$3: $GBW_FALSE [ $1 ] not equals [ $2 ]"
        gbw_tests_count_failures_increment
    fi
}

function gbw_tests_assert {
    local type=$1
    shift

    case $type in
        equals)
            gbw_tests_assert_equals $@
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
    gbw_tests_assert $@
}