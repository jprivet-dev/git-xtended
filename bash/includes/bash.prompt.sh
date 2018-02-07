#!/usr/bin/env bash

function gbw_prompt_time {
    echo "$C_LIGHT_RED\t$F_RESET"
}

function gbw_prompt_user {
    echo "$C_LIGHT_GREEN$USER$F_RESET"
}

function gbw_prompt_host {
    echo "$C_LIGHT_CYAN\h$F_RESET"
}

function gbw_prompt_userhost {
    local user="$(gbw_prompt_user)"
    local host="$(gbw_prompt_host)"
    local glue="@"

    echo "$(gbw_implode \"$glue\" \"$user\" \"$host\")"
}

function gbw_prompt_dir {
    echo "$C_LIGHT_BLUE$PWD$F_RESET"
}

function gbw_prompt_branch {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW$(git_get_current_branch)$F_RESET"
}

function gbw_prompt_changes_count {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW($(git_get_changes_nb))$F_RESET"
}

function gbw_prompt_status_to_be_commited {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_changes_to_be_committed_count)"
    local format="$C_LIGHT_GREEN"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "$format${count}c$F_RESET"
}

function gbw_prompt_status_not_staged {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_changes_not_staged_for_commit_count)"
    local format="$C_LIGHT_RED"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "$format${count}!$F_RESET"
}

function gbw_prompt_status_untracked {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_untracked_files_count)"
    local format="$C_LIGHT_RED"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "$format${count}!$F_RESET"
}

function gbw_prompt_status {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local c="$(gbw_prompt_status_to_be_commited)"
    local s="$(gbw_prompt_status_not_staged)"
    local u="$(gbw_prompt_status_untracked)"

    echo "$(gbw_implode " " \"$c\" \"$s\" \"$u\")"
}

function gbw_prompt_behind {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    echo "$C_LIGHT_GRAY$(git_status_behind_count)↓$F_RESET"
}

function gbw_prompt_ahead {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    echo "$C_LIGHT_GRAY$(git_status_ahead_count $(git_get_current_branch))↑$F_RESET"
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

    local prompt="$(gbw_implode " " \"$time\" \"$userhost\" \"$dir\" \"$branch\" \"$count\" \"$status\" \"$behind\" \"$ahead\")"
    local newline="$F_RESET\n\$ "

    PS1="$prompt$newline"
}

function gbw_prompt_ps2 {
    PS2="$C_CYAN>"
}

PROMPT_COMMAND='gbw_prompt_ps1'
gbw_prompt_ps2

