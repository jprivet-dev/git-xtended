#!/usr/bin/env bash

HOST="\033[02;36m\]\h";
TIME="\033[01;31m\]\t \033[01;32m\]"
LOCATION="\033[01;94m\]$(get_current_working_dir)"
BRANCH="\033[01;33m\]($(get_current_git_branch))\[\033[00m\]\n\$"

PS1="$TIME$USER@$HOST $LOCATION $BRANCH"
PS2="\[\033[01;36m\]>"

