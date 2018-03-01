#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "$_TEST_GBW_PROMPT_TIME" $LINENO
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "$_TEST_GBW_PROMPT_USER" $LINENO
}

function test_gbw_prompt_host {
    assert equals "$(gbw_prompt_host)" "$_TEST_GBW_PROMPT_HOST" $LINENO
}

function test_gbw_prompt_userhost {
    assert equals "$(gbw_prompt_userhost)" "$_TEST_GBW_PROMPT_USERHOST_ESCAPE_AT" $LINENO
}

function test_gbw_prompt_dir {
    assert equals "$(gbw_prompt_dir)" "$_TEST_GBW_PROMPT_DIR" $LINENO
}

function test_gbw_prompt_branch {
    assert equals "$(gbw_prompt_branch)" "$_TEST_GBW_PROMPT_BRANCH" $LINENO
}

function test_gbw_prompt_changes_count {
    assert equals "$(gbw_prompt_changes_count)" "$_TEST_GBW_PROMPT_COUNT" $LINENO
}

function test_gbw_prompt_status_to_be_commited {
    assert equals "$(gbw_prompt_status_to_be_commited)" "$_TEST_GBW_PROMPT_STATUS_C" $LINENO
}

function test_gbw_prompt_status_not_staged {
    assert equals "$(gbw_prompt_status_not_staged)" "$_TEST_GBW_PROMPT_STATUS_S" $LINENO
}

function test_gbw_prompt_status_untracked {
    assert equals "$(gbw_prompt_status_untracked)" "$_TEST_GBW_PROMPT_STATUS_U" $LINENO
}

function test_gbw_prompt_status {
    assert equals "$(gbw_prompt_status)" "$_TEST_GBW_PROMPT_STATUS" $LINENO
}

function test_gbw_prompt_behind {
    local restore="$GBW_GIT_REMOTE_BRANCH_REF"

    GBW_GIT_REMOTE_BRANCH_REF="$_GBW_FAKE_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_behind)" "$_TEST_GBW_PROMPT_BEHIND_NOK" $LINENO

    GBW_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_behind)" "$_TEST_GBW_PROMPT_BEHIND" $LINENO
}

function test_gbw_prompt_ahead {
    local restore="$GBW_GIT_REMOTE_BRANCH_REF"

    GBW_GIT_REMOTE_BRANCH_REF="$_GBW_FAKE_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_ahead)" "$_TEST_GBW_PROMPT_AHEAD_NOK" $LINENO

    GBW_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_ahead)" "$_TEST_GBW_PROMPT_AHEAD" $LINENO
}

# TODO : improve the test
function test_gbw_prompt_git_info {
    local count_lines="$(gbw_prompt_show_info_and_explanations | wc -l)"
    assert equals "$count_lines" "7" $LINENO
}

function test_gbw_prompt_ps1_part1 {
    assert equals "$(gbw_prompt_ps1_part1)" "$_TEST_GBW_PROMPT_PS1_PART1" $LINENO
}

function test_gbw_prompt_ps1_part2 {
    assert equals "$(gbw_prompt_ps1_part2)" "$_TEST_GBW_PROMPT_PS1_PART2" $LINENO
}