#!/usr/bin/env bash

function prompt_ps1_format {
    local _TIME="$C_LIGHT_RED\t"
    local _USER="$C_LIGHT_GREEN$USER@"
    local _HOST="$C_LIGHT_CYAN\h"
    local _DIR="$C_LIGHT_BLUE$(get_current_working_dir)"
    local _BRANCH=""
    local _STATUS_COUNT_TO_BE_COMMITED="$(git_get_status_count_changes_to_be_committed)"
    local _STATUS_COUNT_NOT_STAGED="$(git_get_status_count_changes_not_staged_for_commit)"
    local _STATUS_COUNT_UNTRACKED="$(git_get_status_count_untracked_files)"
    local _STATUS_TO_BE_COMMITED=""
    local _STATUS_NOT_STAGED=""
    local _STATUS_UNTRACKED=""
    local _STATUS=""

    if [[ -n "$(git_get_current_branch)" ]]; then
        _BRANCH=" $C_LIGHT_YELLOW$(git_get_current_branch)"

        if [[ "$(git_get_changes_nb)" > 0 ]]; then
            _BRANCH="$_BRANCH ($(git_get_changes_nb))"

            _STATUS_TO_BE_COMMITED="${C_LIGHT_GREEN}M$_STATUS_COUNT_TO_BE_COMMITED${F_RESET}"
            if [[ "$_STATUS_COUNT_TO_BE_COMMITED" > 0 ]]; then
                _STATUS_TO_BE_COMMITED="$F_UNDERLINED$_STATUS_TO_BE_COMMITED"
            fi

            _STATUS_NOT_STAGED="${C_LIGHT_RED}M$_STATUS_COUNT_NOT_STAGED${F_RESET}"
            if [[ "$_STATUS_COUNT_NOT_STAGED" > 0 ]]; then
                _STATUS_NOT_STAGED="$F_UNDERLINED$_STATUS_NOT_STAGED"
            fi

            _STATUS_UNTRACKED="${C_LIGHT_RED}?$_STATUS_COUNT_UNTRACKED${F_RESET}"
            if [[ "$_STATUS_COUNT_UNTRACKED" > 0 ]]; then
                _STATUS_UNTRACKED="$F_UNDERLINED$_STATUS_UNTRACKED"
            fi

            _STATUS=" $_STATUS_TO_BE_COMMITED $_STATUS_NOT_STAGED $_STATUS_UNTRACKED"
        fi
    fi

    local _END="$F_RESET\n\$ "

    PS1="$_TIME $_USER$_HOST $_DIR$_BRANCH$_STATUS$_END"
}

function prompt_ps2_format {
    PS2="$C_CYAN>"
}

PROMPT_COMMAND='prompt_ps1_format'
prompt_ps2_format

