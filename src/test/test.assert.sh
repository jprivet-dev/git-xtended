#!/usr/bin/env bash

function gx_test_assert_ok() {
  local line=$1
  local message=$2
  local current=$3
  local expected=$4
  local tab="  | "

  if [[ "${TEST_GX_PARAMS_ASSERT_OK_SHOW_MESSAGE}" == 1 ]]; then
    gx_test_pipeline_message_add_title_ok "${line}"
    gx_test_pipeline_message_add "${tab}${message}"
    gx_test_pipeline_message_add "${tab}Current : '${current}'"
    gx_test_pipeline_message_add "${tab}Expected: '${expected}'"
  fi

  echo -e -n "${C_LIGHT_GREEN}+${F_RESET}"
}

function gx_test_assert_nok() {
  local line=$1
  local message=$2
  local current=$3
  local expected=$4
  local tab="  | "

  gx_test_pipeline_message_add_title_failure "${line}"
  gx_test_pipeline_message_add "${tab}${message}"
  gx_test_pipeline_message_add "${tab}Current : '${current}'"
  gx_test_pipeline_message_add "${tab}Expected: '${expected}'"

  gx_test_count_failures_increment

  echo -e -n "${C_BG_RED}${C_WHITE}!${F_RESET}"
}

function gx_test_assert_equals() {
  local current=$1
  local expected=$2
  local line=$3

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Strings are equals" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Strings are not equals" "${current}" "${expected}"
  fi
}

function gx_test_assert_true() {
  local current=$1
  local line=$2
  local expected="${TEST_GX_PARAMS_TRUE}"

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Value is ${expected}" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Value is not ${expected}" "${current}" "${expected}"
  fi
}

function gx_test_assert_false() {
  local current=$1
  local line=$2
  local expected="${TEST_GX_PARAMS_FALSE}"

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Value is ${expected}" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Value is not ${expected}" "${current}" "${expected}"
  fi
}

function gx_test_assert_last_git_command_is() {
  local current="$(gx_test_fake_git_last_args_check)"
  local expected=$1
  local line=$2

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Last git command is the one expected" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Last git command is not the one expected" "${current}" "${expected}"
  fi
}

function gx_test_assert_first_line() {
  local current=$(echo "${1}" | head -n1)
  local expected=$2
  local line=$3

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "First line is the one expected" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "First line is not the one expected" "${current}" "${expected}"
  fi
}

function gx_test_assert_second_line() {
  local current=$(echo "${1}" | head -n2 | tail -n1)
  local expected=$2
  local line=$3

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Second line is the one expected" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Second line is not the one expected" "${current}" "${expected}"
  fi
}

function gx_test_assert_last_line() {
  local current=$(echo "${1}" | tail -n1)
  local expected=$2
  local line=$3

  if [[ "${current}" == "${expected}" ]]; then
    gx_test_assert_ok ${line} "Last line is the one expected" "${current}" "${expected}"
  else
    gx_test_assert_nok ${line} "Last line is not the one expected" "${current}" "${expected}"
  fi
}

function gx_test_assert() {
  local type=$1
  shift

  case $type in
  equals)
    gx_test_assert_equals "$@"
    ;;
  last-git-command-is)
    gx_test_assert_last_git_command_is "$@"
    ;;
  first-line)
    gx_test_assert_first_line "$@"
    ;;
  second-line)
    gx_test_assert_second_line "$@"
    ;;
  last-line)
    gx_test_assert_last_line "$@"
    ;;
  true)
    gx_test_assert_true $1 $2
    ;;
  false)
    gx_test_assert_false $1 $2
    ;;
  *)
    echo -e "${C_LIGHT_RED}[ERROR] Assert type '${type}' does not exist${F_RESET}"
    return
    ;;
  esac

  gx_test_count_assertions_increment
}

function assert() {
  gx_test_assert "$@"
}

function gx_test_assert_pipeline_message_print_all() {
  if [ ${#gx_test_assert_pipeline_message[@]} -eq 0 ]; then
    return
  fi

  for line in "${gx_test_assert_pipeline_message[@]}"; do
    if [[ "${line}" =~ ^-e ]]; then
      echo -e "${line:2}"
    else
      echo "${line}"
    fi
  done

  gx_test_pipeline_message_clear
}

function gx_test_pipeline_message_add_title_ok() {
  local line=$1
  gx_test_assert_pipeline_message+=("-e  ${C_LIGHT_GREEN}| ${line}: OK${F_RESET}")
}

function gx_test_pipeline_message_add_title_failure() {
  local line=$1
  gx_test_assert_pipeline_message+=("-e  ${C_LIGHT_RED}| ${line}: FAILURE${F_RESET}")
}

function gx_test_pipeline_message_add() {
  gx_test_assert_pipeline_message+=("$1")
}

function gx_test_pipeline_message_clear() {
  gx_test_assert_pipeline_message=()
}
