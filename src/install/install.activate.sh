#!/usr/bin/env bash

GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE=""

function gbw_install_active_choice_y_n {
    local choice

    while true; do
        echo -e -n "$1 (y/n): "

        exec < /dev/tty
        read choice

        if [ "$choice" == "y" -o "$choice" == "n" ]; then
            break;
        fi
    done

    if [ "$choice" == "y" ]; then
        GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE=1
        return
    fi

    GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE=0
    return
}

gbw_install_active_choice_y_n "Activate 'Prompt with Git information'"
GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE"

gbw_install_active_choice_y_n "Activate 'Git aliases'"
GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE="$GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE"

gbw_install_active_choice_y_n "Activate 'Git hooks (Agility)'"
GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="$GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE"

gbw_install_active_choice_y_n "Activate 'Git workflow commands (Agility)'"
GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE="$GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE"

gbw_install_active_choice_y_n "Activate 'Bash aliases'"
GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="$GBW_INSTALL_PROMPT_CHOICE_Y_N_LAST_VALUE"

echo "GBW_PARAMS_INSTALL_PROMPT_ACTIVE = $GBW_PARAMS_INSTALL_PROMPT_ACTIVE"
echo "GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE"
echo "GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE = $GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE"
echo "GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE = $GBW_PARAMS_INSTALL_GIT_WORKFLOW_ACTIVE"
echo "GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE = $GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE"