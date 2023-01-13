#!/usr/bin/env bash

function test_gx_bash_aliases_help() {
  local count_lines=$(gx_bash_aliases_help | wc -l)
  assert equals "${count_lines}" "4" $LINENO

  assert first-line   "$(gx_bash_aliases_help)"   "${TEST_C_WHITE}  # Bash aliases (DISABLED)${TEST_F_RESET} :" $LINENO
  assert last-line    "$(gx_bash_aliases_help)"   "    ${TEST_C_LIGHT_GREEN}gti${TEST_F_RESET} ${TEST_C_DARK_GRAY}..............${TEST_F_RESET} Because it could happen to anyone ¯\_(ツ)_/¯" $LINENO
}
