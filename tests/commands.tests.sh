#!/usr/bin/env bash

function test_gx_command_help {
    local count_lines="`gx_command_help | wc -l`"
    assert equals "${count_lines}" "9" $LINENO

    assert first-line   "`gx_command_help`"   "${TEST_C_WHITE}(6) GBW commands${TEST_F_RESET} :" $LINENO
    assert last-line    "`gx_command_help`"   "${TEST_GBW_PARAMS_TAB}gbw ${TEST_C_LIGHT_YELLOW}test${TEST_F_RESET} [<func>] ${TEST_C_DARK_GRAY}...${TEST_F_RESET} Run one or all GBW tests" $LINENO
}

function test_gx_command_help_command_line {
    assert equals "`gx_command_help_command_line`"                                         "    gbw ${TEST_C_LIGHT_YELLOW}${TEST_F_RESET} ${TEST_C_DARK_GRAY}${TEST_F_RESET} " $LINENO
    assert equals "`gx_command_help_command_line "name" "" ... "description"`"             "    gbw ${TEST_C_LIGHT_YELLOW}name${TEST_F_RESET} ${TEST_C_DARK_GRAY}...${TEST_F_RESET} description" $LINENO
    assert equals "`gx_command_help_command_line "name" "<option>" ... "description"`"     "    gbw ${TEST_C_LIGHT_YELLOW}name${TEST_F_RESET} <option> ${TEST_C_DARK_GRAY}...${TEST_F_RESET} description" $LINENO
}