#!/usr/bin/env bash

function test_gbw_git_get_current_branch {
    assert equals "$(gbw_git_get_current_branch)" "current-branch" $LINENO
}

function test_gbw_git_get_changes_nb {
    assert equals "$(gbw_git_get_changes_nb)" "11" $LINENO
}

function test_gbw_git_diff_current_branch_origin_dev {
    assert equals "$(gbw_git_diff_current_branch_origin_dev | wc -l)" "5" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_count)" "5" $LINENO
}

