#!/usr/bin/env bash

# Example :
# test_1="hello"
# test_2="bonjour"
# test_3=""
# gx_implode ', ' 'a' 'b' "$test_1" 3 "$test_2" 4 "$test_3" 5
# a, b, hello, 3, bonjour, 4, 5
function gx_implode() {
  local glue="$1"
  shift

  local -a pieces="($*)"
  local implode=""

  for p in "${pieces[@]}"; do
    p=$(gx_trim "${p}")

    if [[ "${implode}" == "" ]]; then
      [[ "${p}" != "" ]] && implode="${p}"
    else
      [[ "${p}" != "" ]] && implode="${implode}${glue}${p}"
    fi
  done

  echo "${implode}"
}

function gx_is_bash_interactive() {
  [[ $- == *i* ]] &&
    echo "true" ||
    echo "false"
}

# -bash: $'\r': command not found
function gx_remove_r() {
  local file="$1"
  sed -i 's/\r$//' "${file}"
}

function gx_trim() {
  local string="$1"
  echo "${string}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

function gx_regex_remove_colors() {
  echo "$1" | sed -E 's/\\033\[[0-9]{1,3}m//g'
}

function gx_line_generator() {
  local length="$1"
  local symbol="$2"
  local result

  printf -v generator '%*s' "${length}"
  result=${generator// /$symbol}

  echo "${result}"
}

function gx_regex_extract_version() {
  echo "$1" | sed -e 's/^.*[^0-9]\([0-9]\+.[0-9]\+.[0-9]\+\).*$/\1/'
}

function gx_is_good_version() {
  local current_major
  local current_minor
  local current_patch
  IFS="." read current_major current_minor current_patch <<<"$1"

  local target_major
  local target_minor
  local target_patch
  IFS="." read target_major target_minor target_patch <<<"$2"

  if [[ "${current_major}" -lt "${target_major}" ]]; then
    echo "${GX_PARAMS_FALSE}"
    return
  fi

  if [[ "${current_minor}" -lt "${target_minor}" ]]; then
    echo "${GX_PARAMS_FALSE}"
    return
  fi

  if [[ "${current_patch}" -lt "${target_patch}" ]]; then
    echo "${GX_PARAMS_FALSE}"
    return
  fi

  echo "${GX_PARAMS_TRUE}"
}

function gx_symlink_exists() {
  if [[ -L $1 ]]; then
    echo "${GX_PARAMS_TRUE}"
    return
  fi

  echo "${GX_PARAMS_FALSE}"
}
