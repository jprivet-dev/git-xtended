#!/usr/bin/env bash

function test_gbw_prompt_time {
    assert equals "$(gbw_prompt_time)" "\e[91m\t\e[0m"
}

function test_gbw_prompt_user {
    assert equals "$(gbw_prompt_user)" "\e[92m\e[0m"
}
