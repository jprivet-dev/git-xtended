#!/usr/bin/env bash

function test_gbw_bash_aliases_help {
    assert first-line   "`gbw_bash_aliases_help`"   "${TEST_C_WHITE}(5) Bash aliases${TEST_F_RESET} :" $LINENO
    assert last-line    "`gbw_bash_aliases_help`"   "${TEST_GBW_PARAMS_TAB}XX ... WIP" $LINENO
}
