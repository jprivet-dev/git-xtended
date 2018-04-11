#!/usr/bin/env bash

function gbw_install_disable_or_enable {
    local label=$1
    local key=$2
    local function_install=$3
    local choice=""

    gbw_print_choose_one_option "${label}" "${GBW_PARAMS_DISABLED}" "${GBW_PARAMS_ENABLED}"

    [ "${_GBW_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}" == "${GBW_PARAMS_ENABLED}" ] && choice="${GBW_PARAMS_ON}" || choice="${GBW_PARAMS_OFF}"

    if [ "${function_install}" != "" -a "${choice}" == "${GBW_PARAMS_ON}" ]; then
        $function_install
    fi

    gwb_git_config_set "${key}" "${choice}"
}

function gbw_install_choice {
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_PROMPT}"        "${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_GIT_ALIASES}"   "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_GIT_HOOKS}"     "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS}"     "gbw_install_git_hooks"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_WORKFLOW}"      "${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_BASH_ALIASES}"  "${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES}"
}

function gbw_install_choice_params_set_all_from_git_config {
    GBW_PARAMS_INSTALL_PROMPT_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES} ${GBW_PARAMS_OFF}`"
}