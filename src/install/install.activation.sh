#!/usr/bin/env bash

function gx_install_activation() {
  gx_install_choice_params_set_all_from_git_config

  if [ "${GX_PARAMS_INSTALL_PROMPT_STATUS}" == "${GX_PARAMS_ENABLED}" ]; then
    gx_prompt_enabled
  else
    gx_prompt_disabled
  fi

  if [ "${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS}" == "${GX_PARAMS_ENABLED}" ]; then
    gx_git_aliases_enabled
  else
    gx_git_aliases_disabled
  fi

  if [ "${GX_PARAMS_INSTALL_BASH_ALIASES_STATUS}" == "${GX_PARAMS_ENABLED}" ]; then
    gx_bash_aliases_enabled
  else
    gx_bash_aliases_disabled
  fi
}

function gx_install_activation_status_color() {
  [ "$1" == "${GX_PARAMS_ENABLED}" ] && echo "${GX_PARAMS_ENABLED_C}" || echo "${GX_PARAMS_DISABLED_C}"
}

function gx_install_activation_show_status() {
  gx_install_choice_params_set_all_from_git_config

  local gx_prompt_status="$(gx_install_activation_status_color "${GX_PARAMS_INSTALL_PROMPT_STATUS}")"
  local gx_git_aliases_status="$(gx_install_activation_status_color "${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS}")"
  local gx_bash_aliases_status="$(gx_install_activation_status_color "${GX_PARAMS_INSTALL_BASH_ALIASES_STATUS}")"
  local col_width=$((${#GX_PARAMS_GITHUB} + 4))
  local space=" "
  local line=$(gx_print_fixed_width $col_width "-" "" "")
  local line_version=$(gx_print_fixed_width $col_width " " "" "${GX_PARAMS_VERSION}")

  printf "\n"
  gx_logo_color
  printf "%b%s%b\n" "${C_LIGHT_MAGENTA}" "${line_version}" "${F_RESET}"
  printf "\n"

  printf "%b%s%b\n" "${C_DARK_GRAY}" "${line}" "${F_RESET}"
  gx_print_fixed_width -e $col_width "${space}" "${C_DARK_GRAY}>${F_RESET} ${GX_PARAMS_PROMPT_TITLE}" "${gx_prompt_status}"
  gx_print_fixed_width -e $col_width "${space}" "${C_DARK_GRAY}>${F_RESET} ${GX_PARAMS_GIT_ALIASES_TITLE}" "${gx_git_aliases_status}"
  gx_print_fixed_width -e $col_width "${space}" "${C_DARK_GRAY}>${F_RESET} ${GX_PARAMS_BASH_ALIASES_TITLE}" "${gx_bash_aliases_status}"

  printf "%b%s%b\n" "${C_DARK_GRAY}" "${line}" "${F_RESET}"
  printf "%b>%b %s %b<%b\n" "${C_DARK_GRAY}" "${F_RESET}" "${GX_PARAMS_GITHUB}" "${C_DARK_GRAY}" "${F_RESET}"
  printf "%b%s%b\n" "${C_DARK_GRAY}" "${line}" "${F_RESET}"
  printf "\n"
}
