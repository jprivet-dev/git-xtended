#!/usr/bin/env bash

function gbw_install_activation_init {
    # ----------------------------------
    # PROMPT
    # ----------------------------------

    local gbw_prompt_init_state="$GBW_PARAMS_OFF_C"

    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == 1 ]; then
        gbw_prompt_init
        gbw_prompt_init_state="$GBW_PARAMS_ON_C"
    fi

    echo -e "| $GBW_PARAMS_LABEL_PROMPT                   | $gbw_prompt_init_state        |"

    # ----------------------------------
    # GIT ALIASES
    # ----------------------------------

    local gbw_git_aliases_init_state

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

    local gbw_git_hooks_init_state

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

    echo -e "| $GBW_PARAMS_LABEL_WORKFLOW               | (wip)      |"

    # ----------------------------------
    # BASH ALIASES
    # ----------------------------------

    local gbw_bash_aliases_init_state

    if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == 1 ]; then
        gbw_bash_aliases_enable
        gbw_bash_aliases_init_state="$GBW_PARAMS_ON_C"
    else
        gbw_bash_aliases_disable
        gbw_bash_aliases_init_state="$GBW_PARAMS_OFF_C"
    fi

    echo -e "| Bash aliases                                  | $gbw_bash_aliases_init_state        |"
}
