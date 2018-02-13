#!/usr/bin/env bash

function test_gbw_git_get_current_branch {
    assert equals "$(gbw_git_get_current_branch)" "current-branch" $LINENO
}

function test_gbw_git_get_changes_nb {
    assert equals "$(gbw_git_get_changes_nb)" "11" $LINENO
}