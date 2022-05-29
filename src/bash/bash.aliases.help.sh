#!/usr/bin/env bash

function gx_bash_aliases_help() {
  local status=""
  if [ "${GX_PARAMS_INSTALL_BASH_ALIASES_STATUS}" == "${GX_PARAMS_DISABLED}" ]; then
    status=" (${GX_PARAMS_DISABLED_UPPERCASE})"
  fi

  gx_print_colors "${C_WHITE}  # ${GX_PARAMS_BASH_ALIASES_TITLE}${status}${F_RESET} :"
  gx_bash_aliases_help_line "${GX_PARAMS_BASH_ALIAS_G}" "" ................ "Alias with Git autocomplete"
  gx_bash_aliases_help_line "${GX_PARAMS_BASH_ALIAS_GTI}" "" .............. "Because it could happen to anyone ¯\_(ツ)_/¯"
  gx_print
}

function gx_bash_aliases_help_line() {
  local option
  [ "$2" == "" ] && option=" " || option=" $2 "
  gx_print_colors "${GX_PARAMS_TAB}${C_LIGHT_GREEN}$1${F_RESET}${option}${C_DARK_GRAY}$3${F_RESET} $4"
}
