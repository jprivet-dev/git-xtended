#!/usr/bin/env bash

function gx_git_get_current_version {
    gx_regex_extract_version "$(git --version)"
}

function gx_git_current_folder_is_repo {
    git rev-parse --git-dir 2> /dev/null
}

function gx_git_get_current_branch {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

function gx_git_get_current_username {
    git config user.name
}

function gx_git_get_remote_branch_ref {
    git config ${GX_PARAMS_GIT_CONFIG_KEY_GIT_REMOTE_BRANCH_REF} 2> /dev/null
}

function gx_git_status {
    git status --porcelain 2> /dev/null
}

function gx_git_commit_indexed {
    source "${GX_PARAMS_GIT_ALIAS_COMMIT_FILE}"
}

function gx_git_diff_indexed {
    source "${GX_PARAMS_GIT_ALIAS_DIFF_FILE}"
}

function gx_git_status_indexed {
    source "${GX_PARAMS_GIT_ALIAS_STATUS_FILE}"
}

function gx_git_get_changes_nb {
    git status --porcelain | wc -l 2> /dev/null
}

function gx_git_diff_current_branch_origin_dev {
    git diff --stat "$(gx_git_get_remote_branch_ref)" 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed {
    git status --porcelain | grep '^[^? ]' 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed_count {
    git status --porcelain | grep '^[^? ]' | wc -l 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed_modified_count {
    git status --porcelain | grep '^M' | wc -l 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed_modified_extended_count {
    # ' ' = unmodified
    # M = modified / A = added / D = deleted
    # R = renamed / C = copied / U = updated but unmerged
    # ? = untracked / ! = ignored
    # get all without D, A, ? & ' '
    git status --porcelain | grep '^[^DA? ]' | wc -l 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed_deleted_count {
    git status --porcelain | grep '^D' | wc -l 2> /dev/null
}

function gx_git_get_status_changes_to_be_committed_new_file_count {
    git status --porcelain | grep '^A' | wc -l 2> /dev/null
}

function gx_git_get_status_changes_not_staged_for_commit_count {
    git status --porcelain | grep '^.[^? ]' | wc -l 2> /dev/null
}

function gx_git_get_status_untracked_files_count {
    git status --porcelain | grep '^??' | wc -l 2> /dev/null
}

function gx_git_status_ahead {
    local from_branch=$1
    local to_branch=$2
    git rev-list --left-right --count "${from_branch}"..."${to_branch}" 2> /dev/null
}

function gx_git_status_ahead_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gx_git_status_ahead_count called
    # into testing function "test_gx_git_status_ahead_count". Find why !!!
    gx_git_status_ahead "${from_branch}" "${to_branch}" | while read -a array; do echo ${array[0]} ; done
}

function gx_git_status_behind {
    local from_branch=$1
    local to_branch=$2

    git rev-list --left-right --count "${to_branch}"..."${from_branch}" 2> /dev/null
}

function gx_git_status_behind_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gx_git_status_ahead_count called
    # into testing function "test_gx_git_status_behind_count". Find why !!!
    gx_git_status_behind "${from_branch}" "${to_branch}" | while read -a array; do echo ${array[0]} ; done
}

function gx_git_status_extract_only_basename {
    local path=$1
    filename=$(basename -- "${path:3}")
    printf "${filename}\n"
}

function gx_git_status_get_filenames {
	git status --porcelain | grep '^[^? ]' | while read path; do
        printf "$(gx_git_status_extract_only_basename "${path}")\n"
	done
}

function gx_git_status_get_filenames_inline {
    local listing=($(gx_git_status_get_filenames))
    local filenames=$(printf ", %s" "${listing[@]}")
    printf "${filenames:2}\n"
}