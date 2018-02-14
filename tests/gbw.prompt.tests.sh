#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "$TEST_GBW_PROMPT_TIME" $LINENO
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "$TEST_GBW_PROMPT_USER" $LINENO
}

function test_gbw_prompt_host {
    assert equals "$(gbw_prompt_host)" "$TEST_GBW_PROMPT_HOST" $LINENO
}

function test_gbw_prompt_userhost {
    assert equals "$(gbw_prompt_userhost)" "$TEST_GBW_PROMPT_USERHOST_ESCAPE_AT" $LINENO
}

function test_gbw_prompt_dir {
    assert equals "$(gbw_prompt_dir)" "$TEST_GBW_PROMPT_DIR" $LINENO
}

function test_gbw_prompt_branch {
    assert equals "$(gbw_prompt_branch)" "$TEST_GBW_PROMPT_BRANCH" $LINENO
}

function test_gbw_prompt_changes_count {
    assert equals "$(gbw_prompt_changes_count)" "$TEST_GBW_PROMPT_COUNT" $LINENO
}

function test_gbw_prompt_status_to_be_commited {
    assert equals "$(gbw_prompt_status_to_be_commited)" "$TEST_GBW_PROMPT_STATUS_C" $LINENO
}

function test_gbw_prompt_status_not_staged {
    assert equals "$(gbw_prompt_status_not_staged)" "$TEST_GBW_PROMPT_STATUS_S" $LINENO
}

function test_gbw_prompt_status_untracked {
    assert equals "$(gbw_prompt_status_untracked)" "$TEST_GBW_PROMPT_STATUS_U" $LINENO
}

function test_gbw_prompt_status {
    assert equals "$(gbw_prompt_status)" "$TEST_GBW_PROMPT_STATUS" $LINENO
}

function test_gbw_prompt_behind {
    local restore="$GBW_GIT_REMOTE_BRANCH_REF"

    GBW_GIT_REMOTE_BRANCH_REF="$_GBW_FAKE_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_behind)" "$TEST_GBW_PROMPT_BEHIND_NOK" $LINENO

    GBW_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_behind)" "$TEST_GBW_PROMPT_BEHIND" $LINENO
}

function test_gbw_prompt_ahead {
    local restore="$GBW_GIT_REMOTE_BRANCH_REF"

    GBW_GIT_REMOTE_BRANCH_REF="$_GBW_FAKE_REMOTE_BRANCH_REF_NOK"
    assert equals "$(gbw_prompt_ahead)" "$TEST_GBW_PROMPT_AHEAD_NOK" $LINENO

    GBW_GIT_REMOTE_BRANCH_REF="$restore"
    assert equals "$(gbw_prompt_ahead)" "$TEST_GBW_PROMPT_AHEAD" $LINENO
}

# TODO
#function test_gbw_prompt_git_info {
#    assert equals "$(gbw_prompt_git_info)" "" $LINENO
#}

function test_gbw_prompt_ps1_part1 {
    assert equals "$(gbw_prompt_ps1_part1)" "$TEST_GBW_PROMPT_PS1_PART1" $LINENO
}

function test_gbw_prompt_ps1_part2 {
    assert equals "$(gbw_prompt_ps1_part2)" "$TEST_GBW_PROMPT_PS1_PART2" $LINENO
}