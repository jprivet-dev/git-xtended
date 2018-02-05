#!/usr/bin/env bash

function prompt_ps1_format {
    local _PROMPT_TIME="$C_LIGHT_RED\t"
    local _PROMPT_USER="$C_LIGHT_GREEN$USER@"
    local _PROMPT_HOST="$C_LIGHT_CYAN\h"
    local _PROMPT_LOCATION="$C_LIGHT_BLUE$(get_current_working_dir)"

    local _PROMPT_BRANCH=""
    if [[ -n "$(git_get_current_branch)" ]]; then
        _PROMPT_BRANCH=" $C_LIGHT_YELLOW$(git_get_current_branch)"

        if [[ "$(git_get_changes_nb)" > 0 ]]; then
            _PROMPT_BRANCH="$_PROMPT_BRANCH ($(git_get_changes_nb))"
        fi
    fi

    local _PROMPT_END="$F_RESET\n\$ "

    PS1="$_PROMPT_TIME $_PROMPT_USER$_PROMPT_HOST $_PROMPT_LOCATION$_PROMPT_BRANCH$_PROMPT_END"
}

function prompt_ps2_format {
    echo "$C_CYAN>"
}

PROMPT_COMMAND='prompt_ps1_format'

#PS2=$(prompt_ps2_format)

