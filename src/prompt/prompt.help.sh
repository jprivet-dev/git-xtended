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

    echo -e "${C_WHITE}${GBW_PARAMS_LABEL_PROMPT}${F_RESET} :"
    gbw_prompt_help_line_colors "${branch}"      .....           "Current branch"
    gbw_prompt_help_line_colors "${count}"       ...........     "All elements from git status"
    gbw_prompt_help_line_colors "${status_u}"    ...........     "Untracked files"
    gbw_prompt_help_line_colors "${status_s}"    ...........     "Changes not staged for commit"
    gbw_prompt_help_line_colors "${status_c}"    ...             "Changes to be committed"
    gbw_prompt_help_line_colors "${behind}"      ...........     "Commits behind remote branch reference"
    gbw_prompt_help_line_colors "${ahead}"       ..........      "Commits ahead remote branch reference"
    echo
}

function gbw_prompt_help_line_colors {
    echo -e "$(gbw_prompt_help_line $*)"
}

function gbw_prompt_help_line {
    echo "${GBW_PARAMS_TAB}$1 ${C_DARK_GRAY}$2${F_RESET} $3"
}

