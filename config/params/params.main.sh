#!/usr/bin/env bash

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


