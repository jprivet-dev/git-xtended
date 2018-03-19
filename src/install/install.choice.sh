#!/usr/bin/env bash

function gbw_install_choice_y_n {
    local choice
    local label=$1

    while true; do
        echo -e -n "${label} (y/n): "

        exec < /dev/tty
        read choice

        if [ "${choice}" == "y" -o "${choice}" == "n" ]; then
            break;
        fi
    done

    if [ "${choice}" == "y" ]; then
        _GBW_INSTALL_CHOICE_Y_N_LAST_VALUE="${GBW_PARAMS_ON}"
        return
    fi

    _GBW_INSTALL_CHOICE_Y_N_LAST_VALUE="${GBW_PARAMS_OFF}"
    return
}

function gbw_install_choice_prompt {
    gbw_install_choice_y_n "Activate '${GBW_PARAMS_LABEL_PROMPT}'"
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT}" "${_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE}"
}

function gbw_install_choice_aliases {
    gbw_install_choice_y_n "Activate '${GBW_PARAMS_LABEL_GIT_ALIASES}'"
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES}" "${_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE}"
}

function gbw_install_choice_hooks {
    gbw_install_choice_y_n "Activate '${GBW_PARAMS_LABEL_GIT_HOOKS}'"
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS}" "${_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE}"
}

function gbw_install_choice_workflow {
    gbw_install_choice_y_n "Activate '${GBW_PARAMS_LABEL_WORKFLOW}'"
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW}" "${_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE}"
}

function gbw_install_choice_bashaliases {
    gbw_install_choice_y_n "Activate '${GBW_PARAMS_LABEL_BASH_ALIASES}'"
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES}" "${_GBW_INSTALL_CHOICE_Y_N_LAST_VALUE}"
}

function gbw_install_choice {
    gbw_install_choice_prompt
    gbw_install_choice_aliases
    gbw_install_choice_hooks
    gbw_install_choice_workflow
    gbw_install_choice_bashaliases
}

function gbw_install_choice_params_set_all_from_git_config {
    GBW_PARAMS_INSTALL_PROMPT_ACTIVE="$(gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT} ${GBW_PARAMS_OFF})"
    GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE="$(gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES} ${GBW_PARAMS_OFF})"
    GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="$(gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS} ${GBW_PARAMS_OFF})"
    GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE="$(gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW} ${GBW_PARAMS_OFF})"
    GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="$(gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES} ${GBW_PARAMS_OFF})"
}