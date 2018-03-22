#!/usr/bin/env bash

function test_gbw_git_get_current_branch {
    assert equals "$(gbw_git_get_current_branch)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}" $LINENO
    assert last-git-command-is "git rev-parse --abbrev-ref HEAD" $LINENO
}

function test_gbw_git_get_remote_branch_ref {
    local last_value="${GBW_PARAMS_GIT_REMOTE_BRANCH_REF}"

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF=""
    assert equals "$(gbw_git_get_remote_branch_ref)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}" $LINENO
    assert last-git-command-is "git rev-parse --abbrev-ref HEAD" $LINENO

    GBW_PARAMS_GIT_REMOTE_BRANCH_REF="${last_value}"
    assert equals "$(gbw_git_get_remote_branch_ref)" "${TEST_GBW_PARAMS_FAKE_GIT_GET_REMOTE_BRANCH_REF}" $LINENO
    assert last-git-command-is "" $LINENO
}

function test_gbw_git_status {
    local count_lines="$(gbw_git_status | wc -l)"
    assert equals "${count_lines}" "11" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_changes_nb {
    assert equals "$(gbw_git_get_changes_nb)" "11" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_diff_current_branch_origin_dev {
    local count_lines="$(gbw_git_diff_current_branch_origin_dev | wc -l)"
    assert equals "${count_lines}" "5" $LINENO
    assert last-git-command-is "git diff --stat remote-branch" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_count)" "5" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_modified_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_modified_count)" "1" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_modified_extended_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_modified_extended_count)" "3" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_deleted_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_deleted_count)" "1" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_changes_to_be_committed_new_file_count {
    assert equals "$(gbw_git_get_status_changes_to_be_committed_new_file_count)" "1" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_changes_not_staged_for_commit_count {
    assert equals "$(gbw_git_get_status_changes_not_staged_for_commit_count)" "5" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_get_status_untracked_files_count {
    assert equals "$(gbw_git_get_status_untracked_files_count)" "1" $LINENO
    assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gbw_git_status_ahead {
    assert equals "$(gbw_git_status_ahead current-branch remote-branch)" "88      0" $LINENO
    assert last-git-command-is "git rev-list --left-right --count current-branch...remote-branch" $LINENO
}

function test_gbw_git_status_ahead_count {
    assert equals "$(gbw_git_status_ahead_count current-branch remote-branch)" "88" $LINENO
    assert last-git-command-is "git rev-list --left-right --count current-branch...remote-branch" $LINENO
}

function test_gbw_git_status_behind {
    assert equals "$(gbw_git_status_behind current-branch remote-branch)" "0       88" $LINENO
    assert last-git-command-is "git rev-list --left-right --count remote-branch...current-branch" $LINENO
}

function test_gbw_git_status_behind_count {
    assert equals "$(gbw_git_status_behind_count current-branch remote-branch)" "0" $LINENO
    assert last-git-command-is "git rev-list --left-right --count remote-branch...current-branch" $LINENO
}

function test_gbw_git_config_set_global_alias_cmd {
    local name="my_name"
    local value

    value="my_value"
    gbw_git_config_set_global_alias_cmd ${name} ${value}
    assert last-git-command-is "git config --global alias.${name} \"${value}\"" $LINENO

    value="other_value --option"
    gbw_git_config_set_global_alias_cmd ${name} ${value}
    assert last-git-command-is "git config --global alias.${name} \"${value}\"" $LINENO
}

function test_gbw_git_config_set_global_alias_func_cmd {
    local name="my_name"
    local value="my_value"

    gbw_git_config_set_global_alias_func_cmd ${name} "${value}"
    assert last-git-command-is "git config --global alias.${name} \"!f() { ${value}; }; f\"" $LINENO
}

function test_gbw_git_config_set_global_alias_sh_cmd {
    local name="my_name"
    local value="~/my_file.sh"

    gbw_git_config_set_global_alias_sh_cmd ${name} ${value}
    assert last-git-command-is "git config --global alias.${name} !sh -c ${value}" $LINENO
}

function test_gbw_git_config_hooks_help {
    assert first-line   "`gbw_git_config_hooks_help`"   "${TEST_C_WHITE}(3) Git hooks${TEST_F_RESET} :" $LINENO
    assert last-line    "`gbw_git_config_hooks_help`"   "${TEST_GBW_PARAMS_TAB}XX ... WIP" $LINENO
}
