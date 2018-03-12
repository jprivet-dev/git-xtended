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

function gbw_install_choice_init_prompt_active {
    GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_ALIAS_KEY_PROMPT_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate 'Prompt with Git information'"

        GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_ALIAS_KEY_PROMPT_ACTIVE" "$GBW_PARAMS_INSTALL_PROMPT_ACTIVE"
    fi
}

function gbw_install_choice_init_aliases_active {
    GBW_PARAMS_INSTALL_ALIASES_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_ALIAS_KEY_ALIASES_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_ALIASES_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate 'Git aliases'"

        GBW_PARAMS_INSTALL_ALIASES_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_ALIAS_KEY_ALIASES_ACTIVE" "$GBW_PARAMS_INSTALL_ALIASES_ACTIVE"
    fi
}

function gbw_install_choice_init_hooks_active {
    GBW_PARAMS_INSTALL_HOOKS_ACTIVE="$(gwb_git_config_get $GBW_PARAMS_GIT_ALIAS_KEY_HOOKS_ACTIVE)"

    if [ "$GBW_PARAMS_INSTALL_HOOKS_ACTIVE" == "" ]; then
        gbw_install_choice_y_n "Activate 'Git hooks (Agility)'"

        GBW_PARAMS_INSTALL_HOOKS_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"
        gwb_git_config_set "$GBW_PARAMS_GIT_ALIAS_KEY_HOOKS_ACTIVE" "$GBW_PARAMS_INSTALL_HOOKS_ACTIVE"
    fi
}

function gbw_install_choice_init {
    gbw_install_choice_init_prompt_active
    gbw_install_choice_init_aliases_active

    gbw_install_choice_y_n "Activate 'Git hooks (Agility)'"
    GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"

    gbw_install_choice_y_n "Activate 'Git workflow commands (Agility)'"
    GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"

    gbw_install_choice_y_n "Activate 'Bash aliases'"
    GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="$_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE"


    echo "GBW_PARAMS_INSTALL_PROMPT_ACTIVE = $GBW_PARAMS_INSTALL_PROMPT_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE = $GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE"
    echo "GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE = $GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE"
    echo "GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE"
}