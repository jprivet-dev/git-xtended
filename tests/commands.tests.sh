#!/usr/bin/env bash

function test_gbw_command_help {
    assert first-line   "`gbw_command_help`"   "${TEST_C_WHITE}(6) GBW commands${TEST_F_RESET} :" $LINENO
    assert last-line    "`gbw_command_help`"   "${TEST_GBW_PARAMS_TAB}gbw ${TEST_C_LIGHT_YELLOW}test${TEST_F_RESET} [<func>] ${TEST_C_DARK_GRAY}...${TEST_F_RESET} Run one or all GBW tests" $LINENO
}
