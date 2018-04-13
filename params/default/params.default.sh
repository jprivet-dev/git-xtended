#!/usr/bin/env bash

GBW_PARAMS_TAB="    "
GBW_PARAMS_TAB_2="${GBW_PARAMS_TAB}${GBW_PARAMS_TAB}"

GBW_PARAMS_FALSE="false"
GBW_PARAMS_TRUE="true"

GBW_PARAMS_ON="on"
GBW_PARAMS_OFF="off"

GBW_PARAMS_ON_C="${C_BG_GREEN}${C_BLACK} ON  ${F_RESET}"
GBW_PARAMS_OFF_C="${C_BG_RED}${C_WHITE} OFF ${F_RESET}"

GBW_PARAMS_ENABLED="Enabled"
GBW_PARAMS_DISABLED="Disabled"

GBW_PARAMS_ENABLED_C="${C_BG_GREEN}${C_BLACK} Enabled  ${F_RESET}"
GBW_PARAMS_DISABLED_C="${C_BG_RED}${C_WHITE} Disabled ${F_RESET}"

GBW_PARAMS_USER_PS1="\u"
GBW_PARAMS_ROOT="~/git-bash-workflow"
GBW_PARAMS_GBW_SH="${GBW_PARAMS_ROOT}/gbw.sh"
GBW_PARAMS_GITHUB="https://github.com/jprivet-dev/git-bash-workflow.git"
GBW_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH="${GBW_PARAMS_ROOT}/git/hooks/prepare-commit-msg"

GBW_PARAMS_TITLE="Git Bash Workflow"
GBW_PARAMS_TITLE_SHORT="GBW"
GBW_PARAMS_LABEL_PROMPT="(1) Prompt with Git information"
GBW_PARAMS_LABEL_GIT_ALIASES="(2) Git aliases"
GBW_PARAMS_LABEL_GIT_HOOKS="(3) Git hooks"
GBW_PARAMS_LABEL_WORKFLOW="(4) Git workflow commands (Agility)"
GBW_PARAMS_LABEL_BASH_ALIASES="(5) Bash aliases"
GBW_PARAMS_LABEL_GBW_COMMANDS="(6) ${GBW_PARAMS_TITLE_SHORT} commands"

GBW_PARAMS_PRINT_E_TAG="-e"

GBW_PARAMS_Y="y"
GBW_PARAMS_N="n"

GBW_PARAMS_YES="yes"
GBW_PARAMS_NO="no"

Change local
if [ -z ${LC_ALL+x} ]; then
    echo "# LC_ALL is unset > export LC_ALL=C"
    export LC_ALL=C
else
    echo "# LC_ALL is set to '${var}'"
fi


