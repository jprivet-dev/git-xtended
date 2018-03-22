#!/usr/bin/env bash

function test_gbw_command_help {
    assert first-line   "`gbw_command_help`"   "${TEST_C_WHITE}(6) GBW commands${TEST_F_RESET} :" $LINENO
    assert second-line  "`gbw_command_help`"   "${TEST_GBW_PARAMS_TAB}XX ... WIP" $LINENO
    assert last-line    "`gbw_command_help`"   "${TEST_GBW_PARAMS_TAB}XX ... WIP" $LINENO
}
