#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "$GBW_PARAMS_TEST_PROMPT_TIME" $LINENO
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "$GBW_PARAMS_TEST_PROMPT_USER" $LINENO
}

function test_gbw_prompt_host {
    assert equals "$(gbw_prompt_host)" "$GBW_PARAMS_TEST_PROMPT_HOST" $LINENO
}

function test_gbw_prompt_userhost {
    assert equals "$(gbw_prompt_userhost)" "$GBW_PARAMS_TEST_PROMPT_USERHOST" $LINENO
}

function test_gbw_prompt_dir {
    assert equals "$(gbw_prompt_dir)" "$GBW_PARAMS_TEST_PROMPT_DIR" $LINENO
}

function test_gbw_prompt_branch {
    assert equals "$(gbw_prompt_branch)" "$GBW_PARAMS_TEST_PROMPT_BRANCH" $LINENO
}

function test_gbw_prompt_changes_count {
    assert equals "$(gbw_prompt_changes_count)" "$GBW_PARAMS_TEST_PROMPT_COUNT" $LINENO
}

function test_gbw_prompt_status_to_be_commited {
    assert equals "$(gbw_prompt_status_to_be_commited)" "$GBW_PARAMS_TEST_PROMPT_STATUS_C" $LINENO
}

function test_gbw_prompt_status_not_staged {
    assert equals "$(gbw_prompt_status_not_staged)" "$GBW_PARAMS_TEST_PROMPT_STATUS_S" $LINENO
}

function test_gbw_prompt_status_untracked {
    assert equals "$(gbw_prompt_status_untracked)" "$GBW_PARAMS_TEST_PROMPT_STATUS_U" $LINENO
}

function test_gbw_prompt_status {
    assert equals "$(gbw_prompt_status)" "$GBW_PARAMS_TEST_PROMPT_STATUS" $LINENO
}

function test_gbw_prompt_behind {
    local restore="$GBW_PARAMS_GIT_REMOTE_BRANCH_REF"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="$GBW_PARAMS_TEST_FAKE_GIT_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_behind)" "$GBW_PARAMS_TEST_PROMPT_BEHIND_NOK" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_behind)" "$GBW_PARAMS_TEST_PROMPT_BEHIND" $LINENO
}

function test_gbw_prompt_ahead {
    local restore="$GBW_PARAMS_GIT_REMOTE_BRANCH_REF"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="$GBW_PARAMS_TEST_FAKE_GIT_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_ahead)" "$GBW_PARAMS_TEST_PROMPT_AHEAD_NOK" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_ahead)" "$GBW_PARAMS_TEST_PROMPT_AHEAD" $LINENO
}

function test_gbw_prompt_help {
    local count_lines="$(gbw_prompt_help | wc -l)"
    assert equals "$count_lines" "9" $LINENO
}

function test_gbw_prompt_ps1_part1 {
    assert equals "$(gbw_prompt_ps1_part1)" "$GBW_PARAMS_TEST_PROMPT_PS1_PART1" $LINENO
}

function test_gbw_prompt_ps1_part2 {
    assert equals "$(gbw_prompt_ps1_part2)" "$GBW_PARAMS_TEST_PROMPT_PS1_PART2" $LINENO
}

function test_gbw_prompt_ahead_colors {
    assert equals "$(gbw_prompt_ahead_colors 88)" "$GBW_PARAMS_TEST_PROMPT_AHEAD" $LINENO
}

function test_gbw_prompt_ahead_colors_nok {
    assert equals "$(gbw_prompt_ahead_colors "")" "$GBW_PARAMS_TEST_PROMPT_AHEAD_NOK" $LINENO
}

function test_gbw_prompt_behind_colors {
    assert equals "$(gbw_prompt_behind_colors 0)" "$GBW_PARAMS_TEST_PROMPT_BEHIND" $LINENO
    assert equals "$(gbw_prompt_behind_colors "")" "$GBW_PARAMS_TEST_PROMPT_BEHIND_NOK" $LINENO
}

function test_gbw_prompt_branch_colors {
    assert equals "$(gbw_prompt_branch_colors "current-branch")" "$GBW_PARAMS_TEST_PROMPT_BRANCH" $LINENO
    assert equals "$(gbw_prompt_changes_count_colors "11")" "$GBW_PARAMS_TEST_PROMPT_COUNT" $LINENO
}

function test_gbw_prompt_help_line {
    assert equals "$(gbw_prompt_help_line "label" .... "description")"      "    label \e[90m....\e[0m description" $LINENO
}

function test_gbw_prompt_host_colors {
    assert equals "$(gbw_prompt_host_colors "host")" "\e[92mhost\e[0m" $LINENO
}
