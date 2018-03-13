#!/usr/bin/env bash

function gbw_install_activation {
    gbw_install_choice_params_set_all_from_git_config

    [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "$GBW_PARAMS_ON" ]         && gbw_prompt_on
    [ "$GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]    && gbw_git_aliases_on           || gbw_git_aliases_off
    [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "$GBW_PARAMS_ON" ]      && gbw_git_config_hooks_on      || gbw_git_config_hooks_off
    [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "$GBW_PARAMS_ON" ]       && gbw_git_config_workflow_on   || gbw_git_config_workflow_off
    [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "$GBW_PARAMS_ON" ]   && gbw_bash_aliases_on          || gbw_bash_aliases_off
}

function gbw_install_activation_on_off_color {
    [ "$1" == "$GBW_PARAMS_ON" ] && echo "$GBW_PARAMS_ON_C" || echo "$GBW_PARAMS_OFF_C"
}

function gbw_install_activation_show_status {
    gbw_install_choice_params_set_all_from_git_config

    local gbw_prompt_on_off="$(gbw_install_activation_on_off_color $GBW_PARAMS_INSTALL_PROMPT_ACTIVE)"
    local gbw_git_aliases_on_off="$(gbw_install_activation_on_off_color $GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE)"
    local gbw_git_hooks_on_off="$(gbw_install_activation_on_off_color $GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE)"
    local gbw_workflow_on_off="$(gbw_install_activation_on_off_color $GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE)"
    local gbw_bash_aliases_on_off="$(gbw_install_activation_on_off_color $GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE)"

    local line="+------------------------------------------------------------+"
    local col_width=62
    local space=" "

    echo
    echo "$line"
    gbw_echo_fixed_width $col_width "$space" "| $GBW_PARAMS_TITLE" "$GBW_PARAMS_VERSION |"
    echo "$line"

    gbw_echo_fixed_width -e $col_width "$space" "| $GBW_PARAMS_LABEL_PROMPT"        "| $gbw_prompt_on_off |"
    gbw_echo_fixed_width -e $col_width "$space" "| $GBW_PARAMS_LABEL_GIT_ALIASES"   "| $gbw_git_aliases_on_off |"
    gbw_echo_fixed_width -e $col_width "$space" "| $GBW_PARAMS_LABEL_GIT_HOOKS"     "| $gbw_git_hooks_on_off |"
    gbw_echo_fixed_width -e $col_width "$space" "| $GBW_PARAMS_LABEL_WORKFLOW"      "| $gbw_workflow_on_off |"
    gbw_echo_fixed_width -e $col_width "$space" "| $GBW_PARAMS_LABEL_BASH_ALIASES"  "| $gbw_bash_aliases_on_off |"

    echo "$line"
    echo "| @info $GBW_PARAMS_GITHUB |"
    echo "$line"
    echo
}
