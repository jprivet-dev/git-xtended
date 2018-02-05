#!/usr/bin/env bash

function prompt_ps1_format {
    _PROMPT_TIME="$C_LIGHT_RED\t"
    _PROMPT_USER="$C_LIGHT_GREEN$USER@"
    _PROMPT_HOST="$C_LIGHT_CYAN\h"
    _PROMPT_LOCATION="$C_LIGHT_BLUE$(get_current_working_dir)"

    _PROMPT_BRANCH=""
    if [[ -n "$(git_get_current_branch)" ]]; then
        _PROMPT_BRANCH=" $C_LIGHT_YELLOW[$(git_get_changes_nb)] $(git_get_current_branch)"
    fi

    _PROMPT_END="$F_RESET\n\$ "

    echo "$_PROMPT_TIME $_PROMPT_USER$_PROMPT_HOST $_PROMPT_LOCATION$_PROMPT_BRANCH$_PROMPT_END"
}

function prompt_ps2_format {
    echo "$C_CYAN>"
}

#PS1=$(prompt_ps1_format)
PS2=$(prompt_ps2_format)

function _prompt_ps1_format {
    HOST='\033[02;36m\]\h'; HOST=' '$HOST
    TIME='\033[01;31m\]\t \033[01;32m\]'
    LOCATION=' \033[01;94m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'

    if [[ `git status --porcelain --quiet | wc -l` ]]; then
        echo "-- OK --"
    fi

    _PROMPT_BRANCH=' '$C_LIGHT_YELLOW'[`git_get_changes_nb`] `git_get_current_branch`'
    _PROMPT_END=$F_RESET'\n\$ '

    echo "$TIME$USER$HOST$LOCATION$_PROMPT_BRANCH$_PROMPT_END"
}

PS1=`_prompt_ps1_format`

#git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'; }
#HOST='\033[02;36m\]\h'; HOST=' '$HOST
#TIME='\033[01;31m\]\t \033[01;32m\]'
#LOCATION=' \033[01;94m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
#BRANCH=' \033[01;33m\]$(git_branch)\[\033[00m\]\n\$ '
#PS1=$TIME$USER$HOST$LOCATION$BRANCH
#PS2='\[\033[01;36m\]>'

