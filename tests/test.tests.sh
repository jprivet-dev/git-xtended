#!/usr/bin/env bash

function test_gbw_test_fake_git {
    local git_no_fake_command="git no fake command"
    assert equals "`git no fake command`" "[ ERROR !!! No Git fake command for '${git_no_fake_command}' ]" $LINENO
    assert last-git-command-is "${git_no_fake_command}" $LINENO
}
