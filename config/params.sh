#!/usr/bin/env bash

F_BOLD="\e[1m";
F_DIM="\e[2m";
F_UNDERLINED="\e[4m";
F_INVERTED="\e[7m";
F_HIDDEN="\e[8m"
F_RESET="\e[0m"

C_DEFAULT="\e[39m"
C_BLACK="\e[30m"
C_RED="\e[31m"
C_GREEN="\e[32m"
C_YELLOW="\e[33m"
C_BLUE="\e[34m"
C_MAGENTA="\e[35m"
C_CYAN="\e[36m"
C_LIGHT_GRAY="\e[37m"
C_DARK_GRAY="\e[90m"
C_LIGHT_RED="\e[91m"
C_LIGHT_GREEN="\e[92m"
C_LIGHT_YELLOW="\e[93m"
C_LIGHT_BLUE="\e[94m"
C_LIGHT_MAGENTA="\e[95m"
C_LIGHT_CYAN="\e[96m"
C_WHITE="\e[97m"

C_BG_DEFAULT="\e[49m"
C_BG_BLACK="\e[40m"
C_BG_RED="\e[41m"
C_BG_GREEN="\e[42m"
C_BG_YELLOW="\e[43m"
C_BG_BLUE="\e[44m"
C_BG_MAGENTA="\e[45m"
C_BG_CYAN="\e[46m"
C_BG_LIGHT_GRAY="\e[47m"
C_BG_DARK_GRAY="\e[100m"
C_BG_LIGHT_RED="\e[101m"
C_BG_LIGHT_GREEN="\e[102m"
C_BG_LIGHT_YELLOW="\e[103m"
C_BG_LIGHT_BLUE="\e[104m"
C_BG_LIGHT_MAGENTA="\e[105m"
C_BG_LIGHT_CYAN="\e[106m"
C_BG_WHITE="\e[107m"

GBW_VERSION="0.0.0"

GBW_FALSE="false"
GBW_TRUE="true"

GBW_ON="on"
GBW_OFF="off"

GBW_ON_C="${C_LIGHT_GREEN}on ${F_RESET}"
GBW_OFF_C="${C_LIGHT_RED}off${F_RESET}"

GBW_USER_PS1="\u"
GBW_ROOT="~/git-bash-workflow"

GBW_GIT_ALIAS_DIFF_FILE="$GBW_ROOT/src/git/git.alias.diff.sh"
GBW_GIT_ALIAS_COMMIT_FILE="$GBW_ROOT/src/git/git.alias.commit.sh"
GBW_GIT_ALIAS_STATUS_FILE="$GBW_ROOT/src/git/git.alias.status.sh"

GBW_GIT_HOOKS_DIR="$GBW_ROOT/git/hooks/"

# Change local
#if [ -z ${LC_ALL+x} ]; then
#    echo "# LC_ALL is unset > export LC_ALL=C"
#    export LC_ALL=C
#else
#    echo "# LC_ALL is set to '$var'"
#fi

GBW_GIT_REMOTE_BRANCH_REF=""
GBW_TEST_ASSERT_OK_SHOW_MESSAGE=0

GBW_PROMPT_INIT_ACTIVE=1
GBW_GIT_ALIASES_INIT_ACTIVE=1
GBW_GIT_HOOKS_INIT_ACTIVE=1

