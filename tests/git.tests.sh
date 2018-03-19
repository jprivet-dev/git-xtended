#!/usr/bin/env bash

function test_gbw_git_get_current_branch {
    assert equals "$(gbw_git_get_current_branch)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}" $LINENO
}

function test_gbw_git_get_remote_branch_ref {
    local last_value="${GBW_PARAMS_GIT_REMOTE_BRANCH_REF}"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF=""
    assert equals "$(gbw_git_get_remote_branch_ref)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${last_value}"
    assert equals "$(gbw_git_get_remote_branch_ref)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_REMOTE_BRANCH_REF}" $LINENO
}

function test_gbw_git_status {
    local count_lines="$(gbw_git_status | wc -l)"
    assert equals "${count_lines}" "11" $LINENO
}

function test_gbw_git_get_changes_nb {
    assert equals "$(gbw_git_get_changes_nb)" "11" $LINENO
}

function test_gbw_git_diff_current_branch_origin_dev {
    local count_lines="$(gbw_git_diff_current_branch_origin_dev | wc -l)"
    assert equals "${count_lines}" "5" $LINENO
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

function test_gbw_git_status_ahead {
    assert equals "$(gbw_git_status_ahead current-branch remote-branch)" "88      0" $LINENO
}

function test_gbw_git_status_ahead_count {
    assert equals "$(gbw_git_status_ahead_count current-branch remote-branch)" "88" $LINENO
}

function test_gbw_git_status_behind {
    assert equals "$(gbw_git_status_behind current-branch remote-branch)" "0       88" $LINENO
}

function test_gbw_git_status_behind_count {
    assert equals "$(gbw_git_status_behind_count current-branch remote-branch)" "0" $LINENO
}

