#!/usr/bin/env bash

function test_gbw_test_fake_git {
    local no_fake_command_args="no fake command"
    assert equals "$(git ${no_fake_command_args})" "[ ERROR !!! No Git fake command for '${no_fake_command_args}' ]" $LINENO

    assert equals "${gbw_test_fake_git_last_args}" "${no_fake_command_args}" $LINENO
}
