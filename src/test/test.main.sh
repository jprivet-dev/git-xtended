#!/usr/bin/env bash

function gx_test_count_tests_increment() {
  ((gx_test_count_tests++))
}

function gx_test_count_assertions_increment() {
  ((gx_test_count_assertions++))
}

function gx_test_count_failures_increment() {
  ((gx_test_count_failures++))
}

function gx_test_print_results() {
  local message
  local test_plurial
  local assertion_plurial
  local failure_plurial

  [[ ${gx_test_count_tests} > 1 ]]      && test_plurial="tests"           || test_plurial="test"
  [[ ${gx_test_count_assertions} > 1 ]] && assertion_plurial="assertions" || assertion_plurial="assertion"
  [[ ${gx_test_count_failures} > 1 ]]   && failure_plurial="failures"     || failure_plurial="failure"

  message="${gx_test_count_tests} ${test_plurial}, ${gx_test_count_assertions} ${assertion_plurial}, ${gx_test_count_failures} ${failure_plurial}"

  if [[ ${gx_test_count_failures} > 0 ]]; then
    gx_print_title_error "FAILURES! ${message}"
  else
    gx_print_title_success "OK: ${message}"
  fi
}

function gx_test_find_all_func_test() {
  compgen -A function | grep ^test_
}

function gx_test_find_all_func_gx() {
  compgen -A function | grep ^gx_ | grep -v ^gx_test_
}

function gx_test_run() {
  local func=$1

  gx_print_step "Tests launched"

  if [ "${func}" == "" ]; then
    TEST_GX_PARAMS_ASSERT_OK_SHOW_MESSAGE=0
    gx_test_check_func_with_test
    echo
    gx_test_run_all
    return
  fi

  # shellcheck disable=SC2034
  TEST_GX_PARAMS_ASSERT_OK_SHOW_MESSAGE=1

  gx_test_run_only $func
}

function gx_test_run_all() {
  local func_test_list=($(gx_test_find_all_func_test))

  gx_print_title_2 "Launch all tests"

  for func in "${func_test_list[@]}"; do
    gx_test_run_func $func
  done

  gx_test_print_results
}

function gx_test_run_only() {
  local func=$1

  gx_print_title_2 "Launch only one test"

  if type $func &>/dev/null; then
    gx_test_run_func $func
    gx_test_print_results
  else
    echo -e "${C_LIGHT_RED}[ERROR] Test function '${func}' does not exist${F_RESET}"
  fi
}

function gx_test_run_func() {
  local func=$1

  echo -e -n "${C_LIGHT_YELLOW}#${F_RESET} ${func} "
  $func
  gx_test_count_tests_increment

  echo

  gx_test_assert_pipeline_message_print_all
}

function gx_test_check_func_with_test() {
  local func_gx_list=($(gx_test_find_all_func_gx))

  gx_print_title_2 "Functions with test"

  for func in "${func_gx_list[@]}"; do
    func_test_version="test_${func}"

    if type $func_test_version &>/dev/null; then
      echo -e "${C_LIGHT_GREEN}[x]  ${func}${F_RESET}"
    else
      echo -e "${C_LIGHT_BLUE}[ ]  ${func}${F_RESET}"
    fi
  done
}
