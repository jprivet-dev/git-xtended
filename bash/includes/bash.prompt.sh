#!/usr/bin/env bash

function gbw__prompt_ps1 {
    local _TIME="$C_LIGHT_RED\t"
    local _USER="$C_LIGHT_GREEN$USER@"
    local _HOST="$C_LIGHT_CYAN\h"
    local _DIR="$C_LIGHT_BLUE$(get_current_working_dir)"
    local _BRANCH=""
    local _STATUS_TO_BE_COMMITED_COUNT="$(git_get_status_changes_to_be_committed_count)"
    local _STATUS_NOT_STAGED_COUNT="$(git_get_status_changes_not_staged_for_commit_count)"
    local _STATUS_UNTRACKED_COUNT="$(git_get_status_untracked_files_count)"
    local _STATUS_TO_BE_COMMITED=""
    local _STATUS_NOT_STAGED=""
    local _STATUS_UNTRACKED=""
    local _STATUS=""

    local _AHEAD="$(git_status_ahead_count $(git_get_current_branch))↑"
    local _BEHIND_ALERT=""

    if [[ "$(git_status_behind_count)" > 0 ]]; then
        _BEHIND_ALERT="$C_ORANGE*$F_RESET"
    fi

    local _BEHIND="$_BEHIND_ALERT$(git_status_behind_count)↓"
    local _AHEAD_BEHIND="${C_LIGHT_GRAY}$_BEHIND $_AHEAD${F_RESET}"

    local _END="$_BEHIND_ALERT$F_RESET\$ "

    if [[ -n "$(git_get_current_branch)" ]]; then
        _BRANCH=" $C_LIGHT_YELLOW$(git_get_current_branch)"

        if [[ "$(git_get_changes_nb)" > 0 ]]; then
            _BRANCH="$_BRANCH ($(git_get_changes_nb))"

            _STATUS_TO_BE_COMMITED="${C_LIGHT_GREEN}${_STATUS_TO_BE_COMMITED_COUNT}c${F_RESET}"
            if [[ "$_STATUS_TO_BE_COMMITED_COUNT" > 0 ]]; then
                _STATUS_TO_BE_COMMITED="$F_UNDERLINED$_STATUS_TO_BE_COMMITED"
            fi

            _STATUS_NOT_STAGED="${C_LIGHT_RED}$_STATUS_NOT_STAGED_COUNT!${F_RESET}"
            if [[ "$_STATUS_NOT_STAGED_COUNT" > 0 ]]; then
                _STATUS_NOT_STAGED="$F_UNDERLINED$_STATUS_NOT_STAGED"
            fi

            _STATUS_UNTRACKED="${C_LIGHT_RED}$_STATUS_UNTRACKED_COUNT?${F_RESET}"
            if [[ "$_STATUS_UNTRACKED_COUNT" > 0 ]]; then
                _STATUS_UNTRACKED="$F_UNDERLINED$_STATUS_UNTRACKED"
            fi

            _STATUS=" $_STATUS_TO_BE_COMMITED $_STATUS_NOT_STAGED $_STATUS_UNTRACKED"
        fi
    fi

    PS1="$_TIME $_USER$_HOST $_DIR$_BRANCH$_STATUS $_AHEAD_BEHIND\n$_END"
}

function gbw__prompt_ps2 {
    PS2="$C_CYAN>"
}

PROMPT_COMMAND='gbw__prompt_ps1'
gbw__prompt_ps2

