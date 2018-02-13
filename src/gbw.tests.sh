#!/usr/bin/env bash

function gbw_tests_find_all_func_test {
    compgen -A function | grep test_
}

function gbw_tests_run_all {
    gbw_tests_find_all_func_test | while read func; do
        echo "==> $func"
        $func
        echo
    done
}

function gbw_tests_assert_equals {
    if [[ "$1" == "$2" ]]; then
        echo "$3: $GBW_TRUE [ $1 ] equals [ $2 ]"
    else
        echo "$3: $GBW_FALSE [ $1 ] not equals [ $2 ]"
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
}

# gbw_tests_assert_equals alias
function assert {
    gbw_tests_assert $@
}