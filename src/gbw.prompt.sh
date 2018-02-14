#!/usr/bin/env bash

# @test
function gbw_prompt_time {
    echo "$C_LIGHT_RED\t$F_RESET"
}

# @test
function gbw_prompt_user {
    echo "$C_LIGHT_GREEN$GBW_USER$F_RESET"
}

# @test
function gbw_prompt_host {
    echo "$C_LIGHT_CYAN\h$F_RESET"
}

# @test
function gbw_prompt_userhost {
    local user="$(gbw_prompt_user)"
    local host="$(gbw_prompt_host)"
    local glue="@"

    echo "$(gbw_implode \"$glue\" \"$user\" \"$host\")"
}

# @test
function gbw_prompt_dir {
    echo "$C_LIGHT_BLUE\\w$F_RESET"
}

# @test
function gbw_prompt_branch {
    if [[ -z "$(gbw_git_get_current_branch)" ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW$(gbw_git_get_current_branch)$F_RESET"
}

# @test
function gbw_prompt_changes_count {
    if [[ (-z "$(gbw_git_get_current_branch)") || ("$(gbw_git_get_changes_nb)" == 0) ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW($(gbw_git_get_changes_nb))$F_RESET"
}

# @test
function gbw_prompt_status_to_be_commited {
    if [[ (-z "$(gbw_git_get_current_branch)") || ("$(gbw_git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local c="$(gbw_git_get_status_changes_to_be_committed_count)"
    local m="$(gbw_git_get_status_changes_to_be_committed_modified_extended_count)"
    local n="$(gbw_git_get_status_changes_to_be_committed_new_file_count)"
    local d="$(gbw_git_get_status_changes_to_be_committed_deleted_count)"
    local format_c="$C_DARK_GRAY"
    local format_m="$C_DARK_GRAY"
    local format_n="$C_DARK_GRAY"
    local format_d="$C_DARK_GRAY"

    if [[ "$c" > 0 ]]; then
        format_c="$C_LIGHT_GREEN"

        [[ "$m" > 0 ]] && format_m="$C_LIGHT_GREEN" || format_m="$C_CYAN"
        [[ "$n" > 0 ]] && format_n="$C_LIGHT_GREEN" || format_n="$C_CYAN"
        [[ "$d" > 0 ]] && format_d="$C_LIGHT_GREEN" || format_d="$C_CYAN"
    fi

    echo "${format_c}c(${F_RESET}${format_m}${m} ${format_n}+${n} ${format_d}-${d}${F_RESET}${format_c})${F_RESET}"
}

# @test
function gbw_prompt_status_not_staged {
    if [[ (-z "$(gbw_git_get_current_branch)") || ("$(gbw_git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(gbw_git_get_status_changes_not_staged_for_commit_count)"
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] && format="$C_LIGHT_RED"

    echo "$format${count}!$F_RESET"
}

# @test
function gbw_prompt_status_untracked {
    if [[ (-z "$(gbw_git_get_current_branch)") || ("$(gbw_git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(gbw_git_get_status_untracked_files_count)"
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] && format="$C_LIGHT_RED"

    echo "$format${count}?$F_RESET"
}

# @test
function gbw_prompt_status {
    if [[ (-z "$(gbw_git_get_current_branch)") || ("$(gbw_git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local c="$(gbw_prompt_status_to_be_commited)"
    local s="$(gbw_prompt_status_not_staged)"
    local u="$(gbw_prompt_status_untracked)"

    echo "$(gbw_implode " " \"$u\" \"$s\" \"$c\")"
}

function gbw_prompt_behind {
    if [[ -z "$(gbw_git_get_current_branch)" ]]; then
        return
    fi

    local count="$(gbw_git_status_behind_count $(gbw_git_get_current_branch) $GBW_BRANCH_MAIN_REMOTE_DEVELOP)"
    local format="$C_LIGHT_GRAY"

    if [[ -z "$count" ]]; then
        count="x"
        format="$C_LIGHT_RED"
    fi

    echo "$format$count↓$F_RESET"
}

function gbw_prompt_ahead {
    if [[ -z "$(gbw_git_get_current_branch)" ]]; then
        return
    fi

    local count="$(gbw_git_status_ahead_count $(gbw_git_get_current_branch) $GBW_BRANCH_MAIN_REMOTE_DEVELOP)"
    local format="$C_LIGHT_GRAY"

    if [[ -z "$count" ]]; then
        count="x"
        format="$C_LIGHT_RED"
    fi

    echo "$format$count↑$F_RESET"
}

function gbw_prompt_git_info {
    local branch="$(gbw_prompt_branch)"
    local count="$(gbw_prompt_changes_count)"
    local status_c="$(gbw_prompt_status_to_be_commited)"
    local status_s="$(gbw_prompt_status_not_staged)"
    local status_u="$(gbw_prompt_status_untracked)"
    local behind="$(gbw_prompt_behind)"
    local ahead="$(gbw_prompt_ahead)"

    [[ -n "$branch" ]]      && echo -e "$branch : current branch"
    [[ -n "$count" ]]       && echo -e "$count : all elements from git status"
    [[ -n "$status_u" ]]    && echo -e "$status_u : untracked files"
    [[ -n "$status_s" ]]    && echo -e "$status_s : changes not staged for commit"
    [[ -n "$status_c" ]]    && echo -e "$status_c : changes to be committed"
    [[ -n "$behind" ]]      && echo -e "$behind : commits behind $GBW_BRANCH_MAIN_REMOTE_DEVELOP"
    [[ -n "$ahead" ]]       && echo -e "$ahead : commits ahead $GBW_BRANCH_MAIN_REMOTE_DEVELOP"
}

function gbw_prompt_ps1 {
    local time="$(gbw_prompt_time)"
    local userhost="$(gbw_prompt_userhost)"
    local dir="$(gbw_prompt_dir)"
    local branch="$(gbw_prompt_branch)"
    local count="$(gbw_prompt_changes_count)"
    local status="$(gbw_prompt_status)"
    local behind="$(gbw_prompt_behind)"
    local ahead="$(gbw_prompt_ahead)"

    local prompt="$(gbw_implode " " \"$time\" \"$userhost\":\"$dir\" \"$branch\" \"$count\" \"$status\" \"$behind\" \"$ahead\")"
    local newline="$F_RESET\n\$ "

    PS1="$prompt$newline"
}

function gbw_prompt_ps2 {
    PS2="$C_CYAN>"
}

function gbw_prompt_init {
    [[ "$(gbw_is_bash_interactive)" == "false" ]] && return
    PROMPT_COMMAND='gbw_prompt_ps1'
    gbw_prompt_ps2
}

