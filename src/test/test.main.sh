#!/usr/bin/env bash

gbw_test_count_tests=0
gbw_test_count_assertions=0
gbw_test_count_failures=0

function gbw_test_count_tests_increment {
    ((gbw_test_count_tests++))
}

function gbw_test_count_assertions_increment {
    ((gbw_test_count_assertions++))
}

function gbw_test_count_failures_increment {
    ((gbw_test_count_failures++))
}

function gbw_test_print_results {
    local prefix

    local color_ok="$C_LIGHT_GREEN"
    local color_nok="$C_LIGHT_RED"
    local color

    local test_plurial
    local assertion_plurial
    local failure_plurial

    if [[ $gbw_test_count_failures > 0 ]]; then
        prefix="FAILURES !"
        color="$color_nok"
    else
        prefix="OK"
        color="$color_ok"
    fi

    [[ $gbw_test_count_tests > 1 ]]         && test_plurial="tests"             || test_plurial="test"
    [[ $gbw_test_count_assertions > 1 ]]    && assertion_plurial="assertions"   || assertion_plurial="assertion"
    [[ $gbw_test_count_failures > 1 ]]      && failure_plurial="failures"       || failure_plurial="failure"

    echo
    echo -e "$color$prefix ($gbw_test_count_tests $test_plurial, $gbw_test_count_assertions $assertion_plurial, $gbw_test_count_failures $failure_plurial)$F_RESET"
}

function gbw_test_find_all_func_test {
    compgen -A function | grep ^test_
}

function gbw_test_find_all_func_gbw {
    compgen -A function | grep ^gbw_
}

function gbw_test_run {
    local func=$1

    echo
    echo -e "${C_LIGHT_YELLOW}# Testing launch${F_RESET}";
    echo

    if [ "$func" == "" ]; then
        gbw_test_run_all
        return
    fi

    gbw_test_run_only $fun
}

function gbw_test_run_all {
    local func_test_list=($(gbw_test_find_all_func_test))

    for func in "${func_test_list[@]}"
    do
        gbw_test_run_func $func
    done

    gbw_test_print_results
}

function gbw_test_run_only {
    local func=$1

    gbw_test_run_func $func
    gbw_test_print_results
}

function gbw_test_run_func {
    local func=$1

    echo "-- $func"
    $func
    gbw_test_count_tests_increment
}

function gbw_test_check_func_with_test {
    local func_gbw_list=($(gbw_test_find_all_func_gbw))

    echo
    echo -e "${C_LIGHT_YELLOW}# Functions with test${F_RESET}";
    echo

    for func in "${func_gbw_list[@]}"
    do
        func_test_version="test_$func"

        type $func_test_version &>/dev/null \
            && echo -e "$C_LIGHT_GREEN[x]  $func$F_RESET" \
            || echo -e "$C_LIGHT_BLUE[ ]  $func$F_RESET"
    done
}
