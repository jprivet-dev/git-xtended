#!/usr/bin/env bash

function gbw_install_disable_or_enable {
    local label=$1
    local key=$2
    local call_function=$3
    local choice=""

    gbw_print_choose_one_option "${label}" "${GBW_PARAMS_DISABLED}" "${GBW_PARAMS_ENABLED}"

    [ "${_GBW_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}" == "${GBW_PARAMS_ENABLED}" ] && choice="${GBW_PARAMS_ENABLED}" || choice="${GBW_PARAMS_DISABLED}"

    if [ "${call_function}" != "" ]; then
       $call_function "${choice}"
    fi

    gwb_git_config_set "${key}" "${choice}"
}

function gbw_install_choice {
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_PROMPT}"        "${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT_STATUS}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_GIT_ALIASES}"   "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_STATUS}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_GIT_HOOKS}"     "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_STATUS}"     "gbw_install_git_hooks"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_WORKFLOW}"      "${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW_STATUS}"
    gbw_install_disable_or_enable "${GBW_PARAMS_LABEL_BASH_ALIASES}"  "${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_STATUS}"
}

function gbw_install_choice_params_set_all_from_git_config {
    GBW_PARAMS_INSTALL_PROMPT_STATUS="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT_STATUS} ${GBW_PARAMS_DISABLED}`"
    GBW_PARAMS_INSTALL_GIT_ALIASES_STATUS="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_STATUS} ${GBW_PARAMS_DISABLED}`"
    GBW_PARAMS_INSTALL_GIT_HOOKS_STATUS="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_STATUS} ${GBW_PARAMS_DISABLED}`"
    GBW_PARAMS_INSTALL_WORKFLOW_STATUS="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW_STATUS} ${GBW_PARAMS_DISABLED}`"
    GBW_PARAMS_INSTALL_BASH_ALIASES_STATUS="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_STATUS} ${GBW_PARAMS_DISABLED}`"
}