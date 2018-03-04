#!/usr/bin/env bash

# TODO : create test
function gbw_git_current_folder_is_repo {
    git rev-parse --git-dir 2> /dev/null
}

# @test
function gbw_git_get_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# @test
function gbw_git_get_remote_branch_ref {
    local branch="$1"

    if [[ "$GBW_GIT_REMOTE_BRANCH_REF" == "" ]]; then
        gbw_git_get_current_branch
        return
    fi

    echo "$GBW_GIT_REMOTE_BRANCH_REF"
}

# @test
function gbw_git_status {
    git status --porcelain 2> /dev/null
}

# @test
function gbw_git_get_changes_nb {
    gbw_git_status | wc -l
}

# @test
function gbw_git_diff_current_branch_origin_dev {
    local remote_branch="$(gbw_git_get_remote_branch_ref)"
    git diff --stat "$remote_branch" 2> /dev/null
}

# @test
function gbw_git_get_status_changes_to_be_committed_count {
    gbw_git_status | grep '^[^? ]' | wc -l
}

# @test
function gbw_git_get_status_changes_to_be_committed_modified_count {
    gbw_git_status | grep '^M' | wc -l
}

# @test
function gbw_git_get_status_changes_to_be_committed_modified_extended_count {
    # ' ' = unmodified
    # M = modified / A = added / D = deleted
    # R = renamed / C = copied / U = updated but unmerged
    # ? = untracked / ! = ignored
    # get all without D, A, ? & ' '
    gbw_git_status | grep '^[^DA? ]' | wc -l
}

# @test
function gbw_git_get_status_changes_to_be_committed_deleted_count {
    gbw_git_status | grep '^D' | wc -l
}

# @test
function gbw_git_get_status_changes_to_be_committed_new_file_count {
    gbw_git_status | grep '^A' | wc -l
}

# @test
function gbw_git_get_status_changes_not_staged_for_commit_count {
    gbw_git_status | grep '^.[^? ]' | wc -l
}

# @test
function gbw_git_get_status_untracked_files_count {
    gbw_git_status | grep '^??' | wc -l
}

# @test
function gbw_git_status_ahead {
    local from_branch=$1
    local to_branch=$2
    git rev-list --left-right --count "$from_branch"..."$to_branch" 2> /dev/null
}

# @test
function gbw_git_status_ahead_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gbw_git_status_ahead_count called
    # into testing function "test_gbw_git_status_ahead_count". Find why !!!
    gbw_git_status_ahead "$from_branch" "$to_branch" | while read -a array; do echo ${array[0]} ; done
}

# @test
function gbw_git_status_behind {
    local from_branch=$1
    local to_branch=$2

    git rev-list --left-right --count "$to_branch"..."$from_branch" 2> /dev/null
}

# @test
function gbw_git_status_behind_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gbw_git_status_ahead_count called
    # into testing function "test_gbw_git_status_behind_count". Find why !!!
    gbw_git_status_behind "$from_branch" "$to_branch" | while read -a array; do echo ${array[0]} ; done
}