#!/usr/bin/env bash

HOST='\033[02;36m\]\h';
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION='\033[01;94m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH='\033[01;33m\]($(git_extract_current_branch))\[\033[00m\]\n\$ '
PS1="$TIME$USER@$HOST $LOCATION $BRANCH"
PS2='\[\033[01;36m\]>'

