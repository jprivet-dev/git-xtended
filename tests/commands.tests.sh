#!/usr/bin/env bash

function test_gx_commands_help() {
  local count_lines="$(gx_commands_help | wc -l)"
  assert equals "${count_lines}" "12" $LINENO

  assert first-line   "$(gx_commands_help)"   "${TEST_C_WHITE}  # GX commands${TEST_F_RESET} :" $LINENO
  assert last-line    "$(gx_commands_help)"   "${TEST_GX_PARAMS_TAB}gx ${TEST_C_LIGHT_YELLOW}test${TEST_F_RESET} [<func>] ${TEST_C_DARK_GRAY}...${TEST_F_RESET} Run one or all GX tests" $LINENO
}

function test_gx_commands_help_command_line() {
  assert equals "$(gx_commands_help_command_line)"                                         "    gx ${TEST_C_LIGHT_YELLOW}${TEST_F_RESET} ${TEST_C_DARK_GRAY}${TEST_F_RESET} " $LINENO
  assert equals "$(gx_commands_help_command_line "name" "" ... "description")"             "    gx ${TEST_C_LIGHT_YELLOW}name${TEST_F_RESET} ${TEST_C_DARK_GRAY}...${TEST_F_RESET} description" $LINENO
  assert equals "$(gx_commands_help_command_line "name" "<option>" ... "description")"     "    gx ${TEST_C_LIGHT_YELLOW}name${TEST_F_RESET} <option> ${TEST_C_DARK_GRAY}...${TEST_F_RESET} description" $LINENO
}
