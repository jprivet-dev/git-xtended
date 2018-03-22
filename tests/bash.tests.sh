#!/usr/bin/env bash

function test_gbw_bash_aliases_help {
    local first_line="$(gbw_bash_aliases_help | head -n1)"
    assert equals "${first_line}" "jjj" $LINENO

    local second_line="$(gbw_bash_aliases_help | head -n2 | tail -n1)"
    assert equals "${second_line}" "jjj" $LINENO

    local last_line="$(gbw_bash_aliases_help | tail -n1)"
    assert equals "${last_line}" "jjj" $LINENO
}
