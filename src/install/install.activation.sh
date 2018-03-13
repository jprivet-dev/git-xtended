#!/usr/bin/env bash

function gbw_install_activation {
    gbw_install_choice_params_set_all_from_git_config

    # ----------------------------------
    # PROMPT
    # ----------------------------------

    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_prompt_init
    fi

    # ----------------------------------
    # GIT ALIASES
    # ----------------------------------

    if [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_git_aliases_enable
    else
        gbw_git_aliases_disable
    fi

    # ----------------------------------
    # GIT HOOKS
    # ----------------------------------

    if [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_git_config_hooks_enable
    else
        gbw_git_config_hooks_disable
    fi

    # ----------------------------------
    # GIT WORKFLOW
    # ----------------------------------


    if [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        #gbw_git_config_workflow_enable
        nope=1
    else
        #gbw_git_config_workflow_disable
        nope=12
    fi

    # ----------------------------------
    # BASH ALIASES
    # ----------------------------------

    if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_bash_aliases_enable
    else
        gbw_bash_aliases_disable
    fi
}

function gbw_install_activation_show_status {
    gbw_install_choice_params_set_all_from_git_config

    # ----------------------------------
    # PROMPT
    # ----------------------------------

    local gbw_prompt_init_state="$GBW_PARAMS_OFF_C"

    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_prompt_init_state="$GBW_PARAMS_ON_C"
    fi

    echo -e "| $GBW_PARAMS_LABEL_PROMPT                   | $gbw_prompt_init_state        |"

    # ----------------------------------
    # GIT ALIASES
    # ----------------------------------

    local gbw_git_aliases_init_state

    if [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_git_aliases_init_state="$GBW_PARAMS_ON_C"
    else
        gbw_git_aliases_init_state="$GBW_PARAMS_OFF_C"
    fi

    echo -e "| Git aliases                                   | $gbw_git_aliases_init_state        |"

    # ----------------------------------
    # GIT HOOKS
    # ----------------------------------

    local gbw_git_hooks_init_state

    if [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_git_hooks_init_state="$GBW_PARAMS_ON_C"
    else
        gbw_git_hooks_init_state="$GBW_PARAMS_OFF_C"
    fi

    echo -e "| Git hooks                                     | $gbw_git_hooks_init_state        |"

    # ----------------------------------
    # GIT WORKFLOW
    # ----------------------------------

    local gbw_workflow_init_state

    if [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_workflow_init_state="$GBW_PARAMS_ON_C"
    else
        gbw_workflow_init_state="$GBW_PARAMS_OFF_C"
    fi

    echo -e "| $GBW_PARAMS_LABEL_WORKFLOW               | $gbw_workflow_init_state (wip)  |"

    # ----------------------------------
    # BASH ALIASES
    # ----------------------------------

    local gbw_bash_aliases_init_state

    if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "$GBW_PARAMS_ACTIVE" ]; then
        gbw_bash_aliases_init_state="$GBW_PARAMS_ON_C"
    else
        gbw_bash_aliases_init_state="$GBW_PARAMS_OFF_C"
    fi

    echo -e "| Bash aliases                                  | $gbw_bash_aliases_init_state        |"
}
