#!/usr/bin/env bash

function gbw_install_choice_question_yes_no {
    local label=$1
    local key=$2
    local choice=""

    gbw_print_question_yes_no ${label}

    [ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ] && choice="${GBW_PARAMS_ON}" || choice="${GBW_PARAMS_OFF}"

    gwb_git_config_set "${key}" "${choice}"
}

function gbw_install_choice {
    gbw_print_step "Would you like to install... :"

    gbw_install_choice_question_yes_no "${GBW_PARAMS_LABEL_PROMPT}"        "${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT}"
    gbw_install_choice_question_yes_no "${GBW_PARAMS_LABEL_GIT_ALIASES}"   "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES}"
    gbw_install_choice_question_yes_no "${GBW_PARAMS_LABEL_GIT_HOOKS}"     "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS}"
    gbw_install_choice_question_yes_no "${GBW_PARAMS_LABEL_WORKFLOW}"      "${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW}"
    gbw_install_choice_question_yes_no "${GBW_PARAMS_LABEL_BASH_ALIASES}"  "${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES}"
}

function gbw_install_choice_params_set_all_from_git_config {
    GBW_PARAMS_INSTALL_PROMPT_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_PROMPT} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_GIT_ALIASES_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_GIT_HOOKS_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_WORKFLOW_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_WORKFLOW} ${GBW_PARAMS_OFF}`"
    GBW_PARAMS_INSTALL_BASH_ALIASES_ACTIVE="`gwb_git_config_get ${GBW_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES} ${GBW_PARAMS_OFF}`"
}