#!/usr/bin/env bash

function gx_print_fixed_width() {
  local e="${GX_PARAMS_OFF}"
  local width middle_char start end
  local start_no_style end_no_style
  local middle_prefix middle_suffix
  local middle trucate count

  if [ "$1" == "-e" ]; then
    e="${GX_PARAMS_ON}"
    shift
  fi

  width="$1"
  middle_char="$2"
  start="$3"
  end="$4"
  [ "$5" != "" ] && middle_prefix="$5"
  [ "$6" != "" ] && middle_suffix="$6"

  if [ "${e}" == "${GX_PARAMS_ON}" ]; then
    start_no_style=$(gx_regex_remove_colors "${start}")
    end_no_style=$(gx_regex_remove_colors "${end}")
  else
    start_no_style="${start}"
    end_no_style="${end}"
  fi

  middle=$(gx_line_generator "${width}" "${middle_char}")
  count=${#start_no_style}+${#end_no_style}+${#middle_prefix}+${#middle_suffix}
  trucate="${middle_prefix}${middle:$count}${middle_suffix}"

  if [ "${e}" == "${GX_PARAMS_ON}" ]; then
    echo -e "${start}${trucate}${end}"
    return
  fi

  echo "${start}${trucate}${end}"
}

function gx_print_col_fixed_width() {
  local width="$1"
  local text="$2"

  if [[ "${width}" -lt 1 ]]; then
    width=1
  fi

  local text_length=${#text}
  local spaces=""

  for ((i = text_length; i < width; i++)); do
    spaces="${spaces} "
  done

  printf "%s%s" "${text}" "${spaces}"
}

function gx_print() {
  echo "$*"
}

function gx_print_title_1() {
  gx_print_colors_force "${C_BG_YELLOW}${C_BLACK}\n\n $*\n${F_RESET}\n"
}

function gx_print_title_2() {
  gx_print_colors_force "${C_LIGHT_YELLOW}\n--- $* ---\n${F_RESET}"
}

function gx_print_title_success() {
  gx_print_colors_force "${C_BG_GREEN}${C_WHITE}\n\n $* \n${F_RESET}\n"
}

function gx_print_title_error() {
  gx_print_colors_force "${C_BG_RED}${C_WHITE}\n\n $* \n${F_RESET}\n"
}

function gx_print_step() {
  gx_print_colors_force "> $*"
}

function gx_print_colors() {
  if [ "${GX_PARAMS_PRINT_COLORS_ACTIVE}" == "${GX_PARAMS_TRUE}" ]; then
    echo -e "$*"
  else
    echo "$*"
  fi
}

function gx_print_colors_force() {
  echo -e "$*"
}

function gx_print_question_yes_no() {
  local choice
  local label="$*"

  while true; do
    echo -e -n "${C_CYAN}>${F_RESET} ${C_BG_CYAN}${C_BLACK} ${label} ${F_RESET}? [y/n] "

    exec </dev/tty
    read choice

    if [ "${choice}" == "${GX_PARAMS_Y}" -o "${choice}" == "${GX_PARAMS_N}" ]; then
      break
    fi
  done

  if [ "${choice}" == "y" ]; then
    _GX_PRINT_QUESTION_YES_NO_LAST_VALUE="${GX_PARAMS_YES}"
    return
  fi

  # shellcheck disable=SC2034
  _GX_PRINT_QUESTION_YES_NO_LAST_VALUE="${GX_PARAMS_NO}"
}

function gx_print_choose_one_option() {
  local choice
  local label="$1"
  shift

  local -a options="($*)"
  local count="0"
  local o

  local choice_index
  local choice_label

  local message="${C_CYAN}>${F_RESET} ${C_BG_CYAN}${C_BLACK} ${label} ${F_RESET}"

  for o in "${options[@]}"; do
    message="${message}  ${C_LIGHT_CYAN}[${count}]${F_RESET} ${o}"
    ((count++))
  done

  echo -e -n "${message}"

  while true; do
    echo -n " : "

    exec </dev/tty
    read choice_index

    choice_label=""
    count="0"

    for o in "${options[@]}"; do
      if [[ "${choice_index}" == "${count}" ]]; then
        choice_label="${o}"
      fi
      ((count++))
    done

    if [[ "${choice_label}" != "" ]]; then
      break
    fi
  done

  _GX_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE="${choice_label}"

  gx_print_step "${label} = ${_GX_PRINT_CHOOSE_ONE_OPTION_LAST_VALUE}"
}

function gx_print_input_text() {
  local choice
  local label="$1"
  local default_value="$2"

  local message="${C_CYAN}>${F_RESET} ${C_BG_CYAN}${C_BLACK} ${label} ${F_RESET}"

  if [ "${default_value}" != "" ]; then
    message+=" [${default_value}]"
  fi

  message+=": "

  while true; do
    echo -e -n "${message}"

    exec </dev/tty
    read choice

    if [ "${default_value}" != "" -o "${choice}" != "" ]; then
      break
    fi
  done

  _GX_PRINT_INPUT_TEXT_LAST_VALUE="${choice:-${default_value}}"

  gx_print_step "${label} = ${_GX_PRINT_INPUT_TEXT_LAST_VALUE}"
}
