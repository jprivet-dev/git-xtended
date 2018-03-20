#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "${TEST_GBW_PARAMS_PROMPT_TIME}" $LINENO
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "${TEST_GBW_PARAMS_PROMPT_USER}" $LINENO
}

function test_gbw_prompt_host {
    assert equals "$(gbw_prompt_host)" "${TEST_GBW_PARAMS_PROMPT_HOST}" $LINENO
}

function test_gbw_prompt_userhost {
    assert equals "$(gbw_prompt_userhost)" "${TEST_GBW_PARAMS_PROMPT_USERHOST}" $LINENO
}

function test_gbw_prompt_dir {
    assert equals "$(gbw_prompt_dir)" "${TEST_GBW_PARAMS_PROMPT_DIR}" $LINENO
}

function test_gbw_prompt_branch {
    assert equals "$(gbw_prompt_branch)" "${TEST_GBW_PARAMS_PROMPT_BRANCH}" $LINENO
}

function test_gbw_prompt_changes_count {
    assert equals "$(gbw_prompt_changes_count)" "${TEST_GBW_PARAMS_PROMPT_COUNT}" $LINENO
}

function test_gbw_prompt_status_to_be_commited {
    assert equals "$(gbw_prompt_status_to_be_commited)" "${TEST_GBW_PARAMS_PROMPT_STATUS_C}" $LINENO
}

function test_gbw_prompt_status_to_be_commited_colors {
    local test_m0="0"
    local test_n0="+0"
    local test_d0="-0"
    local test_m1="1"
    local test_n1="+1"
    local test_d1="-1"

    assert equals "$(gbw_prompt_status_to_be_commited_colors "0" "0" "0")" "${TEST_C_DARK_GRAY}c(${test_m0} ${test_n0} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "0" "0" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n0} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "0" "1" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n1} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "0" "1" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n1} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "1" "0" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n0} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "1" "0" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n0} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "1" "1" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n1} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_to_be_commited_colors "1" "1" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n1} ${test_d1})${TEST_F_RESET}" $LINENO
}

function test_gbw_prompt_status_not_staged {
    assert equals "$(gbw_prompt_status_not_staged)" "${TEST_GBW_PARAMS_PROMPT_STATUS_S}" $LINENO
}

function test_gbw_prompt_status_not_staged_colors {
    assert equals "$(gbw_prompt_status_not_staged_colors "42")" "${TEST_C_LIGHT_RED}42!${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_not_staged_colors "0")" "${TEST_C_DARK_GRAY}0!${TEST_F_RESET}" $LINENO
}

function test_gbw_prompt_status_untracked {
    assert equals "$(gbw_prompt_status_untracked)" "${TEST_GBW_PARAMS_PROMPT_STATUS_U}" $LINENO
}

function test_gbw_prompt_status_untracked_colors {
    assert equals "$(gbw_prompt_status_untracked_colors "42")" "${TEST_C_LIGHT_RED}42?${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_prompt_status_untracked_colors "0")" "${TEST_C_DARK_GRAY}0?${TEST_F_RESET}" $LINENO
}

function test_gbw_prompt_status {
    assert equals "$(gbw_prompt_status)" "${TEST_GBW_PARAMS_PROMPT_STATUS}" $LINENO
}

function test_gbw_prompt_behind {
    local restore="${GBW_PARAMS_GIT_REMOTE_BRANCH_REF}"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${TEST_GBW_PARAMS_FAKE_GIT_REMOTE_BRANCH_REF_NOK}"
    assert equals "$(gbw_prompt_behind)" "${TEST_GBW_PARAMS_PROMPT_BEHIND_NOK}" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${restore}"
    assert equals "$(gbw_prompt_behind)" "${TEST_GBW_PARAMS_PROMPT_BEHIND}" $LINENO
}

function test_gbw_prompt_ahead {
    local restore="${GBW_PARAMS_GIT_REMOTE_BRANCH_REF}"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${TEST_GBW_PARAMS_FAKE_GIT_REMOTE_BRANCH_REF_NOK}"
    assert equals "$(gbw_prompt_ahead)" "${TEST_GBW_PARAMS_PROMPT_AHEAD_NOK}" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${restore}"
    assert equals "$(gbw_prompt_ahead)" "${TEST_GBW_PARAMS_PROMPT_AHEAD}" $LINENO
}

function test_gbw_prompt_help {
    local count_lines="$(gbw_prompt_help | wc -l)"
    assert equals "${count_lines}" "9" $LINENO
}

function test_gbw_prompt_ps1_part1 {
    assert equals "$(gbw_prompt_ps1_part1)" "${TEST_GBW_PARAMS_PROMPT_PS1_PART1}" $LINENO
}

function test_gbw_prompt_ps1_part2 {
    assert equals "$(gbw_prompt_ps1_part2)" "${TEST_GBW_PARAMS_PROMPT_PS1_PART2}" $LINENO
}

function test_gbw_prompt_ahead_colors {
    assert equals "$(gbw_prompt_ahead_colors 88)" "${TEST_GBW_PARAMS_PROMPT_AHEAD}" $LINENO
    assert equals "$(gbw_prompt_ahead_colors "")" "${TEST_GBW_PARAMS_PROMPT_AHEAD_NOK}" $LINENO
}

function test_gbw_prompt_behind_colors {
    assert equals "$(gbw_prompt_behind_colors 0)" "${TEST_GBW_PARAMS_PROMPT_BEHIND}" $LINENO
    assert equals "$(gbw_prompt_behind_colors "")" "${TEST_GBW_PARAMS_PROMPT_BEHIND_NOK}" $LINENO
}

function test_gbw_prompt_branch_colors {
    assert equals "$(gbw_prompt_branch_colors "current-branch")" "${TEST_GBW_PARAMS_PROMPT_BRANCH}" $LINENO
}

function test_gbw_prompt_changes_count_colors {
    assert equals "$(gbw_prompt_changes_count_colors "11")" "${TEST_GBW_PARAMS_PROMPT_COUNT}" $LINENO
}

function test_gbw_prompt_help_line {
    assert equals "$(gbw_prompt_help_line "label" .... "description")"      "    label ${TEST_C_DARK_GRAY}....${TEST_F_RESET} description" $LINENO
}

function test_gbw_prompt_host_colors {
    assert equals "$(gbw_prompt_host_colors "host")" "${TEST_C_LIGHT_GREEN}host${TEST_F_RESET}" $LINENO
}
