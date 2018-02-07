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
    echo "$C_LIGHT_BLUE\\w$F_RESET"
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

    local c="$(git_get_status_changes_to_be_committed_count)"
    local m="$(git_get_status_changes_to_be_committed_modified_count)"
    local n="$(git_get_status_changes_to_be_committed_new_file_count)"
    local d="$(git_get_status_changes_to_be_committed_deleted_count)"
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

function gbw_prompt_status_not_staged {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_changes_not_staged_for_commit_count)"
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] && format="$C_LIGHT_RED"

    echo "$format${count}!$F_RESET"
}

function gbw_prompt_status_untracked {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_untracked_files_count)"
    local format="$C_DARK_GRAY"

    [[ "$count" > 0 ]] && format="$C_LIGHT_RED"

    echo "$format${count}?$F_RESET"
}

function gbw_prompt_status {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local c="$(gbw_prompt_status_to_be_commited)"
    local s="$(gbw_prompt_status_not_staged)"
    local u="$(gbw_prompt_status_untracked)"

    echo "$(gbw_implode " " \"$u\" \"$s\" \"$c\")"
}

function gbw_prompt_behind {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    local count="$(git_status_behind_count $(git_get_current_branch) $BRANCH_MAIN_REMOTE_DEVELOP)"
    local format="$C_LIGHT_GRAY"

    if [[ -z "$count" ]]; then
        count="x"
        format="$C_LIGHT_RED"
    fi

    echo "$format$count↓$F_RESET"
}

function gbw_prompt_ahead {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    local count="$(git_status_ahead_count $(git_get_current_branch) $BRANCH_MAIN_REMOTE_DEVELOP)"
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


    echo -e "$branch : current branch"
    echo -e "$count : all elements from git status"
    echo -e "$status_u : untracked files"
    echo -e "$status_s : changes not staged for commit"
    echo -e "$status_c : changes to be committed"
    echo -e "$behind : commits behind $BRANCH_MAIN_REMOTE_DEVELOP"
    echo -e "$ahead : commits ahead $BRANCH_MAIN_REMOTE_DEVELOP"
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

