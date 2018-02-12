#!/usr/bin/env bash

function gbw_tests_find_all_func_test {
    compgen -A function | grep test_
}

function gbw_tests_run_all {
    gbw_tests_find_all_func_test
}