#!/usr/bin/env bash

TEST_GBW_PROMPT_TIME="\e[91m\t\e[0m"
TEST_GBW_PROMPT_USER="\e[92muser\e[0m"
TEST_GBW_PROMPT_HOST="\e[96m\h\e[0m"
TEST_GBW_PROMPT_USERHOST="$TEST_GBW_PROMPT_USER\"@\"$TEST_GBW_PROMPT_HOST"
TEST_GBW_PROMPT_DIR="\e[94m\w\e[0m"
TEST_GBW_PROMPT_BRANCH="\e[93mcurrent-branch\e[0m"
TEST_GBW_PROMPT_COUNT="\e[93m(11)\e[0m"
TEST_GBW_PROMPT_STATUS_C="\e[92mc(\e[0m\e[92m3 \e[92m+1 \e[92m-1\e[0m\e[92m)\e[0m"
TEST_GBW_PROMPT_STATUS_S="\e[91m5!\e[0m"
TEST_GBW_PROMPT_STATUS_U="\e[91m1?\e[0m"
TEST_GBW_PROMPT_BEHIND="\e[91mx↓\e[0m"
TEST_GBW_PROMPT_AHEAD="\e[91mx↑\e[0m"

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
    assert equals "$(gbw_prompt_userhost)" "$TEST_GBW_PROMPT_USERHOST" $LINENO
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
    assert equals "$(gbw_prompt_status)" "$TEST_GBW_PROMPT_STATUS_U $TEST_GBW_PROMPT_STATUS_S $TEST_GBW_PROMPT_STATUS_C" $LINENO
}

function test_gbw_prompt_behind {
    assert equals "$(gbw_prompt_behind)" "$TEST_GBW_PROMPT_BEHIND" $LINENO
}

function test_gbw_prompt_ahead {
    assert equals "$(gbw_prompt_ahead)" "$TEST_GBW_PROMPT_AHEAD" $LINENO
}