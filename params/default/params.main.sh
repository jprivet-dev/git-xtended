#!/usr/bin/env bash
# shellcheck disable=SC2034
:

GX_PARAMS_SPLIT="--------------------------------------------------"

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

GX_PARAMS_ENABLED_UPPERCASE="ENABLED"
GX_PARAMS_DISABLED_UPPERCASE="DISABLED"

GX_PARAMS_ENABLED_C="${C_BG_GREEN}${C_BLACK} ${GX_PARAMS_ENABLED_UPPERCASE}  ${F_RESET}"
GX_PARAMS_DISABLED_C="${C_BG_RED}${C_WHITE} ${GX_PARAMS_DISABLED_UPPERCASE} ${F_RESET}"

GX_PARAMS_USER_PS1="\u"
GX_PARAMS_ROOT="~/git-xtended"
GX_PARAMS_GX_SH="${GX_PARAMS_ROOT}/gx.sh"
GX_PARAMS_GITHUB="https://github.com/jprivet-dev/git-xtended"
GX_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH="${GX_PARAMS_ROOT}/git/hooks/prepare-commit-msg"

GX_PARAMS_GX_TITLE="Git Xtended"
GX_PARAMS_GX_TITLE_SHORT="GX"
GX_PARAMS_PROMPT_TITLE="Prompt with Git information"
GX_PARAMS_REMOTE_REF_BRANCH_TITLE="Remote reference branch"
GX_PARAMS_REMOTE_REF_BRANCH_DEFAULT_VALUE="origin/main"
GX_PARAMS_GIT_ALIASES_TITLE="Git aliases"
GX_PARAMS_BASH_ALIASES_TITLE="Bash aliases"
GX_PARAMS_GX_COMMANDS_TITLE="${GX_PARAMS_GX_TITLE_SHORT} commands"
GX_PARAMS_GIT_AUTOLINK_REFERENCE_PREFIX_TITLE="Git autolink reference prefix"
GX_PARAMS_GIT_AUTOLINK_REFERENCE_PREFIX_DEFAULT_VALUE="#"

GX_PARAMS_PRINT_COLORS_ACTIVE="${GX_PARAMS_TRUE}"

GX_PARAMS_Y="y"
GX_PARAMS_N="n"

GX_PARAMS_YES="yes"
GX_PARAMS_NO="no"
