#!/usr/bin/env bash

function prompt_ps1_format {
    _PROMPT_TIME="$C_LIGHT_RED\t"
    _PROMPT_USER="$C_LIGHT_GREEN$USER@"
    _PROMPT_HOST="$C_LIGHT_CYAN\h"
    _PROMPT_LOCATION="$C_LIGHT_BLUE$(get_current_working_dir)"

    _PROMPT_BRANCH=""
    if [[ -n "$(get_current_git_branch)" ]]; then
        _PROMPT_BRANCH=" $C_LIGHT_YELLOW($(get_current_git_branch))"
    fi

    _PROMPT_END="$F_RESET\n\$ "

    echo "$_PROMPT_TIME $_PROMPT_USER$_PROMPT_HOST $_PROMPT_LOCATION$_PROMPT_BRANCH$_PROMPT_END"
}

function prompt_ps2_format {
    echo "$C_CYAN>"
}

PS1=$(prompt_ps1_format)
PS2=$(prompt_ps2_format)

