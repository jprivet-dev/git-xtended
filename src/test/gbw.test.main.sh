#!/usr/bin/env bash

gbw_tests_count_tests=0
gbw_tests_count_assertions=0
gbw_tests_count_failures=0

function gbw_tests_count_tests_increment {
    ((gbw_tests_count_tests++))
}

function gbw_tests_count_assertions_increment {
    ((gbw_tests_count_assertions++))
}

function gbw_tests_count_failures_increment {
    ((gbw_tests_count_failures++))
}

function gbw_tests_print_results {
    local prefix

    local color_ok="$C_LIGHT_GREEN"
    local color_nok="$C_LIGHT_RED"
    local color

    local test_plurial
    local assertion_plurial
    local failure_plurial

    if [[ $gbw_tests_count_failures > 0 ]]; then
        prefix="FAILURES !"
        color="$color_nok"
    else
        prefix="OK"
        color="$color_ok"
    fi

    [[ $gbw_tests_count_tests > 1 ]] && test_plurial="tests" || test_plurial="test"
    [[ $gbw_tests_count_assertions > 1 ]] && assertion_plurial="assertions" || assertion_plurial="assertion"
    [[ $gbw_tests_count_failures > 1 ]] && failure_plurial="failures" || failure_plurial="failure"

    echo
    echo -e "$color$prefix ($gbw_tests_count_tests $test_plurial, $gbw_tests_count_assertions $assertion_plurial, $gbw_tests_count_failures $failure_plurial)$F_RESET"
}

function gbw_tests_find_all_func_test {
    compgen -A function | grep ^test_
}

function gbw_tests_run_all {
    func_test_list=($(gbw_tests_find_all_func_test))

    for func in "${func_test_list[@]}"
    do
        echo "-- $func"
        $func
        gbw_tests_count_tests_increment
    done

    gbw_tests_print_results
}
