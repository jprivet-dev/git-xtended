#!/usr/bin/env bash

# @test
function gbw_prompt_help {
    local branch=$(gbw_prompt_branch_colors "branch")
    local count=$(gbw_prompt_changes_count_colors "8")
    local status_u=$(gbw_prompt_status_untracked_colors "2")
    local status_s=$(gbw_prompt_status_not_staged_colors "3")
    local status_c=$(gbw_prompt_status_to_be_commited_colors "2" "0" "1")
    local behind=$(gbw_prompt_behind_colors "3")
    local ahead=$(gbw_prompt_ahead_colors "42")

    echo "$GBW_PARAMS_LABEL_PROMPT :"
    gbw_prompt_help_line_dots "$branch"      "Current branch"
    gbw_prompt_help_line_dots "$count"       "All elements from git status"
    gbw_prompt_help_line_dots "$status_u"    "Untracked files"
    gbw_prompt_help_line_dots "$status_s"    "Changes not staged for commit"
    gbw_prompt_help_line_dots "$status_c"    "Changes to be committed"
    gbw_prompt_help_line_dots "$behind"      "Commits behind remote branch reference"
    gbw_prompt_help_line_dots "$ahead"       "Commits ahead remote branch reference"
    echo
}

# TODO: create test
function gbw_prompt_help_line_dots {
    local width=12
    local ellipsis="..."
    local text_dots=$(gbw_echo_fixed_width -e $width "." "$1 " "")

    echo -e "${GBW_PARAMS_TAB}$text_dots$ellipsis $2"
}

