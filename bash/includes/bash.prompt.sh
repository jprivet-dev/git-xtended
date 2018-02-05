#!/usr/bin/env bash

function prompt_ps1_format {
    local _TIME="$C_LIGHT_RED\t"
    local _USER="$C_LIGHT_GREEN$USER@"
    local _HOST="$C_LIGHT_CYAN\h"
    local _DIR="$C_LIGHT_BLUE$(get_current_working_dir)"

    local _BRANCH=""
    if [[ -n "$(git_get_current_branch)" ]]; then
        _BRANCH=" $C_LIGHT_YELLOW$(git_get_current_branch)"

        if [[ "$(git_get_changes_nb)" > 0 ]]; then
            _BRANCH="$_BRANCH ($(git_get_changes_nb))"
        fi
    fi

    local _END="$F_RESET\n\$ "

    PS1="$_TIME $_USER$_HOST $_DIR$_BRANCH$_END"
}

function prompt_ps2_format {
    PS2="$C_CYAN>"
}

PROMPT_COMMAND='prompt_ps1_format'
prompt_ps2_format

