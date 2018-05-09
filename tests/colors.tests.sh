#!/usr/bin/env bash

function test_gx_colors_print_all {
    local count_lines="$(gx_colors_print_all | wc -l)"
    assert equals "${count_lines}" "41" $LINENO
}
