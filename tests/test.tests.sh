#!/usr/bin/env bash

function test_gbw_test_fake_git {
    local no_fake_command="no fake command"
    assert equals "$(gbw_test_fake_git ${no_fake_command})" "[ ERROR !!! No Git fake command for '${no_fake_command}' ]" $LINENO
    assert equals "${gbw_test_fake_git_last_args}" "git ${no_fake_command}" $LINENO
}
