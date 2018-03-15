#!/usr/bin/env bash

# @test
function gbw_prompt_time {
    echo $(gbw_prompt_time_colors "\t")
}

function gbw_prompt_time_colors {
    local time=$1
    echo "$C_LIGHT_RED$time$F_RESET"
}

# @test
function gbw_prompt_user {
    echo $(gbw_prompt_user_colors "$GBW_PARAMS_USER_PS1")
}

function gbw_prompt_user_colors {
    local user=$1
    echo "$C_LIGHT_GREEN$user$F_RESET"
}

# @test
function gbw_prompt_host {
    echo $(gbw_prompt_host_colors "\h")
}

function gbw_prompt_host_colors {
    local host=$1
    echo "$C_LIGHT_GREEN$host$F_RESET"
}

# @test
function gbw_prompt_userhost {
    echo $(gbw_prompt_userhost_colors "$(gbw_prompt_user)" "$(gbw_prompt_host)")
}

function gbw_prompt_userhost_colors {
    local user=$1
    local host=$2
    echo "$user$C_LIGHT_GREEN@$F_RESET$host"
}

# @test
function gbw_prompt_dir {
    echo "$C_CYAN\\w$F_RESET"
}

# @test
function gbw_prompt_branch {
    echo $(gbw_prompt_branch_colors "$(gbw_git_get_current_branch)")
}

function gbw_prompt_branch_colors {
    local branch=$1
    echo "$C_LIGHT_YELLOW($branch)$F_RESET"
}

# @test
function gbw_prompt_changes_count {
    echo $(gbw_prompt_changes_count_colors "$(gbw_git_get_changes_nb)")
}

function gbw_prompt_changes_count_colors {
    local count=$1
    echo "$C_LIGHT_MAGENTA$count≡$F_RESET"
}

# @test
function gbw_prompt_status_to_be_commited {
    local m="$(gbw_git_get_status_changes_to_be_committed_modified_extended_count)"
    local n="$(gbw_git_get_status_changes_to_be_committed_new_file_count)"
    local d="$(gbw_git_get_status_changes_to_be_committed_deleted_count)"

    echo $(gbw_prompt_status_to_be_commited_colors "$m" "$n" "$d")
}

function gbw_prompt_status_to_be_commited_colors {
    local format_c="$C_LIGHT_GREEN"

    local m=$1
    local n=$2
    local d=$3

    [[ "$m$n$d" == "000" ]] \
        && format_c="$C_DARK_GRAY"

    echo "${format_c}c($m +$n -$d)${F_RESET}"
}

# @test
function gbw_prompt_status_not_staged {
    local count="$(gbw_git_get_status_changes_not_staged_for_commit_count)"
    echo $(gbw_prompt_status_not_staged_colors "$count")
}

function gbw_prompt_status_not_staged_colors {
    local count=$1
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] \
        && format="$C_LIGHT_RED"

    echo "$format${count}!$F_RESET"
}

# @test
function gbw_prompt_status_untracked {
    local count="$(gbw_git_get_status_untracked_files_count)"
    echo $(gbw_prompt_status_untracked_colors "$count")
}

function gbw_prompt_status_untracked_colors {
    local count=$1
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] \
        && format="$C_LIGHT_RED"

    echo "$format${count}?$F_RESET"
}

# @test
function gbw_prompt_status {
    echo "$(gbw_prompt_status_untracked) $(gbw_prompt_status_not_staged) $(gbw_prompt_status_to_be_commited)"
}

# @test
function gbw_prompt_behind {
    local count="$(gbw_git_status_behind_count $(gbw_git_get_current_branch) $(gbw_git_get_remote_branch_ref))"
    echo $(gbw_prompt_behind_colors "$count")
}

function gbw_prompt_behind_colors {
    local count=$1
    local format="$C_LIGHT_GRAY"

    if [[ -z "$count" ]]; then
        count="x"
        format="$C_LIGHT_RED"
    fi

    echo "$format$count↓$F_RESET"
}

# @test
function gbw_prompt_ahead {
    local count="$(gbw_git_status_ahead_count $(gbw_git_get_current_branch) $(gbw_git_get_remote_branch_ref))"
    echo $(gbw_prompt_ahead_colors "$count")
}

function gbw_prompt_ahead_colors {
    local count=$1
    local format="$C_LIGHT_GRAY"

    if [[ -z "$count" ]]; then
        count="x"
        format="$C_LIGHT_RED"
    fi

    echo "$format$count↑$F_RESET"
}

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

# @test
function gbw_prompt_ps1_part1 {
    ps1="$(gbw_prompt_time) $(gbw_prompt_userhost):$(gbw_prompt_dir)"

    if [[ -d "$(gbw_git_current_folder_is_repo)" ]]; then
        ps1="$ps1 $(gbw_prompt_branch)"

        if [[ "$(gbw_git_get_changes_nb)" != 0 ]]; then
            ps1="$ps1 $(gbw_prompt_changes_count) $(gbw_prompt_status)"
        fi

        ps1="$ps1 $(gbw_prompt_behind) $(gbw_prompt_ahead)"
    fi

    echo "$ps1"
}

# @test
function gbw_prompt_ps1_part2 {
    echo "$F_RESET\n\$ "
}

function gbw_prompt_set_ps1 {
    PS1="$(gbw_prompt_ps1_part1)$(gbw_prompt_ps1_part2)"
}

function gbw_prompt_set_ps2 {
    PS2="$C_CYAN>"
}

function gbw_prompt_on {
    if [[ "$(gbw_is_bash_interactive)" == "false" ]]; then
        return
    fi
    PROMPT_COMMAND='gbw_prompt_set_ps1'
    gbw_prompt_set_ps2
}
