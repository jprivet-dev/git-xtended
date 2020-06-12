#!/usr/bin/env bash

function gx_prompt_help() {
    local username_branch=$(gx_prompt_username_branch_colors "username" "branch")
    local count=$(gx_prompt_changes_count_colors "8")
    local status_u=$(gx_prompt_status_untracked_colors "1")
    local status_s=$(gx_prompt_status_not_staged_colors "3")
    local status_c=$(gx_prompt_status_to_be_commited_colors "2" "1" "1")
    local behind=$(gx_prompt_behind_colors "3")
    local ahead=$(gx_prompt_ahead_colors "42")
    local remote_branch_ref=$(gx_git_get_remote_branch_ref)

    gx_print_colors "${C_WHITE}  # ${GX_PARAMS_LABEL_PROMPT}${F_RESET} :"
    gx_prompt_help_line "${username_branch}"    ...                   "Current Git username & branch"
    gx_prompt_help_line "${count}"              .................     "All elements from git status"
    gx_prompt_help_line "${status_u}"           .................     "Untracked files"
    gx_prompt_help_line "${status_s}"           .................     "Changes not staged for commit"
    gx_prompt_help_line "${status_c}"           .........             "Changes to be committed"
    gx_prompt_help_line "${behind}"             .................     "Commits behind remote branch reference (${remote_branch_ref})"
    gx_prompt_help_line "${ahead}"              ................      "Commits ahead remote branch reference (${remote_branch_ref})"
    echo
}

function gx_prompt_help_line() {
    gx_print_colors "${GX_PARAMS_TAB}$1 ${C_DARK_GRAY}$2${F_RESET} $3"
}
