#!/usr/bin/env bash

source ~/git-bash-workflow/src/install/install.activate.sh

# ----------------------------------
# PROMPT
# ----------------------------------

gbw_prompt_init_state="$GBW_PARAMS_OFF_C"

if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == 1 ]; then
    gbw_prompt_init
    gbw_prompt_init_state="$GBW_PARAMS_ON_C"
fi

echo -e "| Prompt with Git information                   | $gbw_prompt_init_state        |"

# ----------------------------------
# GIT ALIASES
# ----------------------------------

if [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == 1 ]; then
    gbw_git_aliases_enable
    gbw_git_aliases_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_aliases_disable
    gbw_git_aliases_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git aliases                                   | $gbw_git_aliases_init_state        |"

# ----------------------------------
# GIT HOOKS
# ----------------------------------

if [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == 1 ]; then
    gbw_git_config_hooks_enable
    gbw_git_hooks_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_config_hooks_disable
    gbw_git_hooks_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git hooks                                     | $gbw_git_hooks_init_state        |"

# ----------------------------------
# GIT WORKFLOW
# ----------------------------------

echo -e "| Git workflow commands (Agility)               | (wip)      |"

# ----------------------------------
# BASH ALIASES
# ----------------------------------

if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == 1 ]; then
    gbw_bash_aliases_enable
    gbw_bash_aliases_init_state="$GBW_PARAMS_ON_C"
else
    gbw_bash_aliases_disable
    gbw_bash_aliases_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Bash aliases                                  | $gbw_bash_aliases_init_state        |"

