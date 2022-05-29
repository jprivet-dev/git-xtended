#!/usr/bin/env bash

function gx_install_disable_or_enable() {
  local label=$1
  local key=$2
  local call_function=$3
  local choice=""

  gx_print_choose_one_option "${label}" "${GX_PARAMS_DISABLED}" "${GX_PARAMS_ENABLED}"

  [ "${_GX_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}" == "${GX_PARAMS_ENABLED}" ] && choice="${GX_PARAMS_ENABLED}" || choice="${GX_PARAMS_DISABLED}"

  if [ "${call_function}" != "" ]; then
    $call_function "${choice}"
  fi

  gx_git_config_set "${key}" "${choice}"
}

function gx_install_input_text() {
  local label=$1
  local key=$2
  local default_value=$3

  gx_print_input_text "${label}" "${default_value}"

  gx_git_config_set "${key}" "${_GX_PRINT_INPUT_TEXT_LAST_VALUE}"
}

function gx_install_choice() {
  gx_install_disable_or_enable "${GX_PARAMS_PROMPT_TITLE}" "${GX_PARAMS_GIT_CONFIG_KEY_PROMPT_STATUS}"
  printf "\n"

  if [ "${_GX_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}" == "${GX_PARAMS_ENABLED}" ]; then
    gx_install_input_text "${GX_PARAMS_REMOTE_REF_BRANCH_TITLE}" "${GX_PARAMS_GIT_CONFIG_KEY_GIT_REMOTE_REF_BRANCH}" "${GX_PARAMS_REMOTE_REF_BRANCH_DEFAULT_VALUE}"
    printf "\n"
  fi

  gx_install_disable_or_enable "${GX_PARAMS_GIT_ALIASES_TITLE}" "${GX_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_STATUS}"
  printf "\n"

  gx_install_disable_or_enable "${GX_PARAMS_BASH_ALIASES_TITLE}"  "${GX_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_STATUS}"
  printf "\n"

  if [ "${_GX_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}" == "${GX_PARAMS_ENABLED}" ]; then
    gx_install_input_text "${GX_PARAMS_GIT_AUTOLINK_REFERENCE_PREFIX_TITLE}" "${GX_PARAMS_GIT_CONFIG_KEY_GIT_AUTOLINK_REFERENCE_PREFIX}" "${GX_PARAMS_GIT_AUTOLINK_REFERENCE_PREFIX_DEFAULT_VALUE}"
    printf "\n"
  fi
  #    gx_install_disable_or_enable "${GX_PARAMS_LABEL_GIT_HOOKS}"     "${GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_STATUS}"     "gx_install_git_hooks"
  #    gx_install_disable_or_enable "${GX_PARAMS_LABEL_WORKFLOW}"      "${GX_PARAMS_GIT_CONFIG_KEY_WORKFLOW_STATUS}"
}

# shellcheck disable=SC2034
function gx_install_choice_params_set_all_from_git_config() {
  GX_PARAMS_INSTALL_PROMPT_STATUS="$(gx_git_config_get ${GX_PARAMS_GIT_CONFIG_KEY_PROMPT_STATUS} ${GX_PARAMS_DISABLED})"
  GX_PARAMS_INSTALL_GIT_ALIASES_STATUS="$(gx_git_config_get ${GX_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_STATUS} ${GX_PARAMS_DISABLED})"
  #    GX_PARAMS_INSTALL_GIT_HOOKS_STATUS="$(gx_git_config_get ${GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_STATUS} ${GX_PARAMS_DISABLED})"
  #    GX_PARAMS_INSTALL_WORKFLOW_STATUS="$(gx_git_config_get ${GX_PARAMS_GIT_CONFIG_KEY_WORKFLOW_STATUS} ${GX_PARAMS_DISABLED})"
  GX_PARAMS_INSTALL_BASH_ALIASES_STATUS="$(gx_git_config_get ${GX_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_STATUS} ${GX_PARAMS_DISABLED})"
}
