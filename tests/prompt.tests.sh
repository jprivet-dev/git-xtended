#!/usr/bin/env bash

function test_gx_prompt_time() {
    assert equals "$(gx_prompt_time)" "${TEST_GX_PARAMS_PROMPT_TIME}" $LINENO
}

function test_gx_prompt_time_colors() {
    local time="10:42:00"
    assert equals "$(gx_prompt_time_colors "${time}")" "${TEST_C_LIGHT_RED}${time}${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_user() {
    assert equals "$(gx_prompt_user)" "${TEST_GX_PARAMS_PROMPT_USER}" $LINENO
}

function test_gx_prompt_user_colors() {
    local user="current_user"
    assert equals "$(gx_prompt_user_colors "${user}")" "${TEST_C_LIGHT_GREEN}${user}${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_host() {
    assert equals "$(gx_prompt_host)" "${TEST_GX_PARAMS_PROMPT_HOST}" $LINENO
}

function test_gx_prompt_host_colors() {
    local host="current_host"
    assert equals "$(gx_prompt_host_colors "${host}")" "${TEST_C_LIGHT_GREEN}${host}${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_userhost() {
    assert equals "$(gx_prompt_userhost)" "${TEST_GX_PARAMS_PROMPT_USERHOST}" $LINENO
}

function test_gx_prompt_userhost_colors() {
    local user="current_userhost"
    local host="current_userhost"
    assert equals "$(gx_prompt_userhost_colors "${user}" "${host}")" "${user}${TEST_C_LIGHT_GREEN}@${F_RESET}${host}" $LINENO
}

function test_gx_prompt_dir() {
    assert equals "$(gx_prompt_dir)" "${TEST_GX_PARAMS_PROMPT_DIR}" $LINENO
}

function test_gx_prompt_changes_count() {
    assert equals "$(gx_prompt_changes_count)" "${TEST_GX_PARAMS_PROMPT_COUNT}" $LINENO
}

function test_gx_prompt_status_to_be_commited() {
    assert equals "$(gx_prompt_status_to_be_commited)" "${TEST_GX_PARAMS_PROMPT_STATUS_C}" $LINENO
}

function test_gx_prompt_status_to_be_commited_colors() {
    local test_m0="0"
    local test_n0="+0"
    local test_d0="-0"
    local test_m1="1"
    local test_n1="+1"
    local test_d1="-1"

    assert equals "$(gx_prompt_status_to_be_commited_colors "0" "0" "0")" "${TEST_C_DARK_GRAY}c(${test_m0} ${test_n0} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "0" "0" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n0} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "0" "1" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n1} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "0" "1" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m0} ${test_n1} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "1" "0" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n0} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "1" "0" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n0} ${test_d1})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "1" "1" "0")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n1} ${test_d0})${TEST_F_RESET}" $LINENO
    assert equals "$(gx_prompt_status_to_be_commited_colors "1" "1" "1")" "${TEST_C_LIGHT_GREEN}c(${test_m1} ${test_n1} ${test_d1})${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_status_not_staged() {
    assert equals "$(gx_prompt_status_not_staged)" "${TEST_GX_PARAMS_PROMPT_STATUS_S}" $LINENO
}

function test_gx_prompt_status_not_staged_colors() {
    local count

    count="42"
    assert equals "$(gx_prompt_status_not_staged_colors "${count}")" "${TEST_C_LIGHT_RED}${count}!${TEST_F_RESET}" $LINENO
    count="0"
    assert equals "$(gx_prompt_status_not_staged_colors "${count}")" "${TEST_C_DARK_GRAY}${count}!${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_status_untracked() {
    assert equals "$(gx_prompt_status_untracked)" "${TEST_GX_PARAMS_PROMPT_STATUS_U}" $LINENO
}

function test_gx_prompt_status_untracked_colors() {
    local count

    count="42"
    assert equals "$(gx_prompt_status_untracked_colors "${count}")" "${TEST_C_LIGHT_RED}${count}?${TEST_F_RESET}" $LINENO
    count="0"
    assert equals "$(gx_prompt_status_untracked_colors "${count}")" "${TEST_C_DARK_GRAY}${count}?${TEST_F_RESET}" $LINENO
}

function test_gx_prompt_status() {
    assert equals "$(gx_prompt_status)" "${TEST_GX_PARAMS_PROMPT_STATUS}" $LINENO
}

function test_gx_prompt_behind() {
    assert equals "$(gx_prompt_behind)" "${TEST_GX_PARAMS_PROMPT_BEHIND}" $LINENO
}

function test_gx_prompt_ahead() {
    assert equals "$(gx_prompt_ahead)" "${TEST_GX_PARAMS_PROMPT_AHEAD}" $LINENO
}

function test_gx_prompt_help() {
    local count_lines="$(gx_prompt_help | wc -l)"
    assert equals "${count_lines}" "9" $LINENO

    assert first-line   "$(gx_prompt_help)"   "${TEST_C_WHITE}  # Prompt with Git information${TEST_F_RESET} :" $LINENO
    assert last-line    "$(gx_prompt_help)"   "${TEST_GX_PARAMS_TAB}${TEST_C_LIGHT_GRAY}42↑${TEST_F_RESET} ${TEST_C_DARK_GRAY}................${TEST_F_RESET} Commits ahead remote branch reference (${TEST_GX_PARAMS_FAKE_GIT_REMOTE_BRANCH_REF})" $LINENO
}

function test_gx_prompt_ps1_part1() {
    assert equals "$(gx_prompt_ps1_part1)" "${TEST_GX_PARAMS_PROMPT_PS1_PART1}" $LINENO
}

function test_gx_prompt_ps1_part2() {
    assert equals "$(gx_prompt_ps1_part2)" "${TEST_GX_PARAMS_PROMPT_PS1_PART2}" $LINENO
}

function test_gx_prompt_ahead_colors() {
    assert equals "$(gx_prompt_ahead_colors 88)" "${TEST_GX_PARAMS_PROMPT_AHEAD}" $LINENO
    assert equals "$(gx_prompt_ahead_colors "")" "${TEST_GX_PARAMS_PROMPT_AHEAD_NOK}" $LINENO
}

function test_gx_prompt_behind_colors() {
    assert equals "$(gx_prompt_behind_colors "10")" "${TEST_GX_PARAMS_PROMPT_BEHIND}" $LINENO
    assert equals "$(gx_prompt_behind_colors "")" "${TEST_GX_PARAMS_PROMPT_BEHIND_NOK}" $LINENO
}

function test_gx_prompt_username_branch_colors() {
    assert equals "$(gx_prompt_username_branch_colors "current-username" "current-branch")" "${TEST_GX_PARAMS_PROMPT_USERNAME_BRANCH}" $LINENO
}

function test_gx_prompt_changes_count_colors() {
    assert equals "$(gx_prompt_changes_count_colors "11")" "${TEST_GX_PARAMS_PROMPT_COUNT}" $LINENO
}

function test_gx_prompt_help_line() {
    local label="Label"
    local dots="...."
    local description="Description"

    assert equals "$(gx_prompt_help_line "${label}" $dots "${description}")" "${TEST_GX_PARAMS_TAB}${label} ${TEST_C_DARK_GRAY}${dots}${TEST_F_RESET} ${description}" $LINENO

    local label="A long label"
    local dots="........"
    local description="A long description"

    assert equals "$(gx_prompt_help_line "${label}" $dots "${description}")" "${TEST_GX_PARAMS_TAB}${label} ${TEST_C_DARK_GRAY}${dots}${TEST_F_RESET} ${description}" $LINENO
}
