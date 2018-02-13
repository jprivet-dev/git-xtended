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

function test_gbw_git_get_status_changes_to_be_committed_modified_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_modified_count)" "1" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_modified_extended_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_modified_extended_count)" "3" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_deleted_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_deleted_count)" "1" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_new_file_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_new_file_count)" "1" $LINENO
}

function test_gbw_git_get_status_changes_not_staged_for_commit_count {
    assert equals "$(gbw_git_get_status_changes_not_staged_for_commit_count)" "5" $LINENO
}

function test_gbw_git_get_status_untracked_files_count {
    assert equals "$(gbw_git_get_status_untracked_files_count)" "1" $LINENO
}

function test_gbw_git_status_ahead_count {
    assert equals "$(gbw_git_status_ahead_count current-branch remote-branch)" "88" $LINENO
}

