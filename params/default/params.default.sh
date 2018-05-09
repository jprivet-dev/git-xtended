#!/usr/bin/env bash

GX_PARAMS_TAB="    "
GX_PARAMS_TAB_2="${GX_PARAMS_TAB}${GX_PARAMS_TAB}"

GX_PARAMS_FALSE="false"
GX_PARAMS_TRUE="true"

GX_PARAMS_ON="on"
GX_PARAMS_OFF="off"

GX_PARAMS_ON_C="${C_BG_GREEN}${C_BLACK} ON  ${F_RESET}"
GX_PARAMS_OFF_C="${C_BG_RED}${C_WHITE} OFF ${F_RESET}"

GX_PARAMS_ENABLED="Enabled"
GX_PARAMS_DISABLED="Disabled"

GX_PARAMS_ENABLED_C="${C_BG_GREEN}${C_BLACK} Enabled  ${F_RESET}"
GX_PARAMS_DISABLED_C="${C_BG_RED}${C_WHITE} Disabled ${F_RESET}"

GX_PARAMS_USER_PS1="\u"
GX_PARAMS_ROOT="~/git-xtended"
GX_PARAMS_GX_SH="${GX_PARAMS_ROOT}/gx.sh"
GX_PARAMS_GITHUB="https://github.com/jprivet-dev/git-xtended.git"
GX_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH="${GX_PARAMS_ROOT}/git/hooks/prepare-commit-msg"

GX_PARAMS_TITLE="Git Xtended"
GX_PARAMS_TITLE_SHORT="GX"
GX_PARAMS_LABEL_PROMPT="(1) Prompt with Git information"
GX_PARAMS_LABEL_GIT_ALIASES="(2) Git aliases"
GX_PARAMS_LABEL_GIT_HOOKS="(3) Git hooks"
GX_PARAMS_LABEL_WORKFLOW="(4) Git workflow commands (Agility)"
GX_PARAMS_LABEL_BASH_ALIASES="(5) Bash aliases"
GX_PARAMS_LABEL_GX_COMMANDS="(6) ${GX_PARAMS_TITLE_SHORT} commands"

GX_PARAMS_PRINT_E_TAG="-e"

GX_PARAMS_Y="y"
GX_PARAMS_N="n"

GX_PARAMS_YES="yes"
GX_PARAMS_NO="no"

Change local
if [ -z ${LC_ALL+x} ]; then
    echo "# LC_ALL is unset > export LC_ALL=C"
    export LC_ALL=C
else
    echo "# LC_ALL is set to '${var}'"
fi


