#!/usr/bin/env bash

function gbw_install_activation {
    gbw_install_choice_params_set_all_from_git_config

    [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "$GBW_PARAMS_ON" ]         && gbw_prompt_on
    [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]    && gbw_git_aliases_on           || gbw_git_aliases_off
    [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "$GBW_PARAMS_ON" ]      && gbw_git_config_hooks_on      || gbw_git_config_hooks_off
    [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "$GBW_PARAMS_ON" ]       && gbw_git_config_workflow_on   || gbw_git_config_workflow_off
    [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]   && gbw_bash_aliases_on          || gbw_bash_aliases_off
}

function gbw_install_activation_show_status {
    gbw_install_choice_params_set_all_from_git_config

    local gbw_prompt_on_off="$GBW_PARAMS_OFF_C"
    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "$GBW_PARAMS_ON" ]; then
        gbw_prompt_on_off="$GBW_PARAMS_ON_C"
    fi

    local gbw_git_aliases_on_off="$GBW_PARAMS_OFF_C"
    if [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]; then
        gbw_git_aliases_on_off="$GBW_PARAMS_ON_C"
    fi

    local gbw_git_hooks_on_off="$GBW_PARAMS_OFF_C"
    if [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "$GBW_PARAMS_ON" ]; then
        gbw_git_hooks_on_off="$GBW_PARAMS_ON_C"
    fi

    local gbw_workflow_on_off="$GBW_PARAMS_OFF_C"
    if [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "$GBW_PARAMS_ON" ]; then
        gbw_workflow_on_off="$GBW_PARAMS_ON_C"
    fi

    local gbw_bash_aliases_on_off="$GBW_PARAMS_OFF_C"
    if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]; then
        gbw_bash_aliases_on_off="$GBW_PARAMS_ON_C"
    fi

    echo
    echo -e "+------------------------------------------------------------+"
    echo -e "| $GBW_PARAMS_TITLE                                    $GBW_PARAMS_VERSION |"
    echo -e "+------------------------------------------------------------+"

    echo -e "| $GBW_PARAMS_LABEL_PROMPT                   | $gbw_prompt_on_off        |"
    echo -e "| Git aliases                                   | $gbw_git_aliases_on_off        |"
    echo -e "| Git hooks                                     | $gbw_git_hooks_on_off        |"
    echo -e "| $GBW_PARAMS_LABEL_WORKFLOW               | $gbw_workflow_on_off (wip)  |"
    echo -e "| Bash aliases                                  | $gbw_bash_aliases_on_off        |"

    echo -e "+------------------------------------------------------------+"
    echo -e "| @info https://github.com/jprivet-dev/git-bash-workflow.git |"
    echo -e "+------------------------------------------------------------+"
    echo
}
