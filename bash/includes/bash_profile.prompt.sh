#!/usr/bin/env bash

_PROMPT_HOST="\033[02;36m\]\h"
_PROMPT_TIME="\033[01;31m\]\t"
_PROMPT_USER="\033[01;32m\]$USER"
_PROMPT_LOCATION="\033[01;94m\]$(get_current_working_dir)"
_PROMPT_BRANCH="\033[01;33m\]($(get_current_git_branch))\[\033[00m\]"
_PROMPT_END="\n\$ "

PS1="$_PROMPT_TIME $_PROMPT_USER@$_PROMPT_HOST $_PROMPT_LOCATION $_PROMPT_BRANCH$_PROMPT_END"
PS2="\[\033[01;36m\]>"

