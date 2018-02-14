#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "\e[91m\t\e[0m" $LINENO
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "\e[92muser\e[0m" $LINENO
}

function test_gbw_prompt_host {
    assert equals "$(gbw_prompt_host)" "\e[96m\h\e[0m" $LINENO
}

function test_gbw_prompt_userhost {
    assert equals "$(gbw_prompt_userhost)" "\e[92muser\e[0m\"@\"\e[96m\h\e[0m" $LINENO
}

function test_gbw_prompt_dir {
    assert equals "$(gbw_prompt_dir)" "\e[94m\w\e[0m" $LINENO
}

function test_gbw_prompt_branch {
    assert equals "$(gbw_prompt_branch)" "\e[93mcurrent-branch\e[0m" $LINENO
}

function test_gbw_prompt_changes_count {
    assert equals "$(gbw_prompt_changes_count)" "\e[93m(11)\e[0m" $LINENO
}

function test_gbw_prompt_status_to_be_commited {
    assert equals "$(gbw_prompt_status_to_be_commited)" "\e[92mc(\e[0m\e[92m3 \e[92m+1 \e[92m-1\e[0m\e[92m)\e[0m" $LINENO
}

function test_gbw_prompt_status_not_staged {
    assert equals "$(gbw_prompt_status_not_staged)" "\e[91m5!\e[0m" $LINENO
}

function test_gbw_prompt_status_untracked {
    assert equals "$(gbw_prompt_status_untracked)" "\e[91m1?\e[0m" $LINENO
}

function test_gbw_prompt_status {
    assert equals "$(gbw_prompt_status)" "\e[91m1?\e[0m \e[91m5!\e[0m \e[92mc(\e[0m\e[92m3 \e[92m+1 \e[92m-1\e[0m\e[92m)\e[0m" $LINENO
}