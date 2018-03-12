#!/usr/bin/env bash

_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE=""

function gbw_install_choice_y_n {
    local choice
    local label=$1

    while true; do
        echo -e -n "$label (y/n): "

        exec < /dev/tty
        read choice

        if [ "$choice" == "y" -o "$choice" == "n" ]; then
            break;
        fi
    done

    if [ "$choice" == "y" ]; then
        _GBW_INSTALL_CHOICE_Y_N_LAST_VALUE=1
        return
    fi

    _GBW_INSTALL_CHOICE_Y_N_LAST_VALUE=0
    return
}

function gbw_install_choice_init_prompt {
    GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_CONFIG_KEY_PROMPT_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate '$GBW_PARAMS_LABEL_PROMPT'"

        GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_CONFIG_KEY_PROMPT_ACTIVE" "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE"
    fi
}

function gbw_install_choice_init_aliases {
    GBW_PARAMS_INSTALL_ALIASES_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_ALIASES_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate '$GBW_PARAMS_LABEL_GIT_ALIASES'"

        GBW_PARAMS_INSTALL_ALIASES_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_ACTIVE" "$GBW_PARAMS_INSTALL_ALIASES_ACTIVE"
    fi
}

function gbw_install_choice_init_hooks {
    GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate '$GBW_PARAMS_LABEL_GIT_HOOKS'"

        GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_ACTIVE" "$GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE"
    fi
}

function gbw_install_choice_init_workflow {
    GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate '$GBW_PARAMS_LABEL_WORKFLOW'"

        GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW_ACTIVE" "$GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE"
    fi
}

function gbw_install_choice_init_bashaliases {
    GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate '$GBW_PARAMS_LABEL_BASH_ALIASES'"

        GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_ACTIVE" "$GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE"
    fi
}

function gbw_install_choice_init {
    gbw_install_choice_init_prompt
    gbw_install_choice_init_aliases
    gbw_install_choice_init_hooks
    gbw_install_choice_init_workflow
    gbw_install_choice_init_bashaliases

    echo "GBW_PARAMS_INSTALL_PROMPT_ACTIVE = $GBW_PARAMS_INSTALL_PROMPT_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE = $GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE = $GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE"
    echo "GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE"
}