#!/usr/bin/env bash

# Alias of gx_commands_parse_action
function gx() {
  gx_commands_parse_action "$@"
}

# See the list of actions in params/default/params.commands.sh
function gx_commands_parse_action() {
  local action=$1
  shift

  if [ "${action}" == "" ]; then
    gx_commands_action_help
    return
  fi

  local func_name="gx_commands_action_${action}"

  if type "${func_name}" &>/dev/null; then
    $func_name "$@"
    return
  fi

  echo "[ERROR] 'gx ${action}' : unknow action"
}

function gx_commands_action_config() {
  git "${GX_PARAMS_GIT_ALIAS_CONFGX}"
}

function gx_commands_action_install() {
  gx_print_title_1 "${GX_PARAMS_GX_TITLE} install (Global configuration)"

  gx_install_choice
  gx_install_activation
  gx_install_activation_show_status
}

function gx_commands_action_status() {
  gx_install_activation_show_status
}

function gx_commands_action_help() {
  gx_install_activation_show_status
  gx_prompt_help
  gx_git_config_aliases_help
  gx_commands_help
}

function gx_commands_action_prompt() {
  echo ""
  gx_prompt_help
}

function gx_commands_action_alias() { # !!! `aliases` does not work
  echo ""
  gx_git_config_aliases_help
}

function gx_commands_action_commands() {
  echo ""
  gx_commands_help
}

function gx_commands_action_colors() {
  gx_colors_print_all
}

function gx_commands_action_test() {
  source ~/git-xtended/gx.tests.sh
}

function gx_commands_action_aliases() {
  gx_commands_config_git_aliases "$@"
}

function gx_commands_action_reload() {
  eval "source ${GX_PARAMS_GX_SH}"
}

function gx_commands_config_git_aliases() {
  local global=""
  local unset=""
  local i

  for i in "$@"; do
    case $i in
    -g | --global)
      global="--global"
      ;;
    --unset)
      unset="--unset"
      ;;
    *)
      echo "Unknown option '${i}'"
      return
      ;;
    esac
  done

  if [[ "${unset}" == "--unset" ]]; then
    gx_git_config_unset_aliases $global
  else
    gx_git_config_set_aliases $global
  fi
}
