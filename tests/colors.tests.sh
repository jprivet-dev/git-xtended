#!/usr/bin/env bash

function test_gbw_colors_print_all {
    local count_lines="`gbw_colors_print_all | wc -l`"
    assert equals "${count_lines}" "41" $LINENO
}
