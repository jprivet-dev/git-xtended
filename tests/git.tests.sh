#!/usr/bin/env bash

function test_gx_git_get_current_branch() {
  assert equals "$(gx_git_get_current_branch)" "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" $LINENO
  assert last-git-command-is "git rev-parse --abbrev-ref HEAD" $LINENO
}

function test_gx_git_get_remote_ref_branch() {
  assert equals "$(gx_git_get_remote_ref_branch)" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}" $LINENO
  assert last-git-command-is "git config ${GX_PARAMS_GIT_CONFIG_KEY_GIT_REMOTE_REF_BRANCH}" $LINENO
}

function test_gx_git_get_autolink_reference_prefix() {
  assert equals "$(gx_git_get_autolink_reference_prefix)" "${TEST_GX_PARAMS_FAKE_GIT_AUTOLINK_REFERENCE_PREFIX}" $LINENO
  assert last-git-command-is "git config ${GX_PARAMS_GIT_CONFIG_KEY_GIT_AUTOLINK_REFERENCE_PREFIX}" $LINENO
}

function test_gx_git_status() {
  local count_lines=$(gx_git_status | wc -l)
  assert equals "${count_lines}" "11" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_changes_nb() {
  assert equals "$(gx_git_get_changes_nb)" "11" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_diff_current_branch_origin_dev() {
  local count_lines=$(gx_git_diff_current_branch_origin_dev | wc -l)
  assert equals "${count_lines}" "5" $LINENO
  assert last-git-command-is "git diff --stat ${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed_count() {
  assert equals "$(gx_git_get_status_changes_to_be_committed_count)" "5" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed() {
  local count_lines=$(gx_git_get_status_changes_to_be_committed | wc -l)
  assert equals "${count_lines}" "5" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed_modified_count() {
  assert equals "$(gx_git_get_status_changes_to_be_committed_modified_count)" "1" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed_modified_extended_count() {
  assert equals "$(gx_git_get_status_changes_to_be_committed_modified_extended_count)" "3" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed_deleted_count() {
  assert equals "$(gx_git_get_status_changes_to_be_committed_deleted_count)" "1" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_to_be_committed_new_file_count() {
  assert equals "$(gx_git_get_status_changes_to_be_committed_new_file_count)" "1" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_changes_not_staged_for_commit_count() {
  assert equals "$(gx_git_get_status_changes_not_staged_for_commit_count)" "5" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_get_status_untracked_files_count() {
  assert equals "$(gx_git_get_status_untracked_files_count)" "1" $LINENO
  assert last-git-command-is "git status --porcelain" $LINENO
}

function test_gx_git_status_ahead() {
  assert equals "$(gx_git_status_ahead "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}")" "88      0" $LINENO
  assert last-git-command-is "git rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}...${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}" $LINENO

  assert equals "$(gx_git_status_ahead "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH_NOK}")" "" $LINENO
  assert last-git-command-is "git rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}...${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH_NOK}" $LINENO
}

function test_gx_git_status_ahead_count() {
  assert equals "$(gx_git_status_ahead_count "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}")" "88" $LINENO
  assert last-git-command-is "git rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}...${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}" $LINENO
}

function test_gx_git_status_behind() {
  assert equals "$(gx_git_status_behind "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}")" "10       32" $LINENO
  assert last-git-command-is "git rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}...${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" $LINENO
}

function test_gx_git_status_behind_count() {
  assert equals "$(gx_git_status_behind_count "${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" "${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}")" "10" $LINENO
  assert last-git-command-is "git rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_GIT_REMOTE_REF_BRANCH}...${TEST_GX_PARAMS_FAKE_CURRENT_BRANCH}" $LINENO
}

function test_gx_git_status_get_filenames() {
  local count_lines=$(gx_git_status_get_filenames | wc -l)
  assert equals "${count_lines}" "5" $LINENO
}

function test_gx_git_status_extract_only_basename() {
  local path

  path="M  path/to/my/file.sh"
  assert equals "$(gx_git_status_extract_only_basename "${path}")" "file.sh" $LINENO

  path=" M path/to/my/file.sh"
  assert equals "$(gx_git_status_extract_only_basename "${path}")" "file.sh" $LINENO

  path="M  file.sh"
  assert equals "$(gx_git_status_extract_only_basename "${path}")" "file.sh" $LINENO

  path=" M file.sh"
  assert equals "$(gx_git_status_extract_only_basename "${path}")" "file.sh" $LINENO
}

function test_gx_git_status_get_filenames_inline() {
  local count_lines=$(gx_git_status_get_filenames_inline | wc -l)
  assert equals "${count_lines}" "1" $LINENO

  assert equals "$(gx_git_status_get_filenames_inline)" "modified, added, deleted, renamed, copied" $LINENO
}

function test_gx_git_config_set_global_alias_cmd() {
  local name="my_name"
  local value

  value="my_value"
  gx_git_config_set_global_alias_cmd "${name}" "${value}"
  assert last-git-command-is "git config --global alias.${name} \"${value}\"" $LINENO

  value="other_value --option"
  gx_git_config_set_global_alias_cmd "${name}" "${value}"
  assert last-git-command-is "git config --global alias.${name} \"${value}\"" $LINENO
}

function test_gx_git_config_set_global_alias_func_cmd() {
    local name="my_name"
    local value="my_value"

    gx_git_config_set_global_alias_func_cmd ${name} "${value}"
    assert last-git-command-is "git config --global alias.${name} \"!f() { ${value}; }; f\"" $LINENO
}

function test_gx_git_config_set_global_alias_sh_cmd() {
  local name="my_name"
  local value="~/my_file.sh"

  gx_git_config_set_global_alias_sh_cmd ${name} ${value}
  assert last-git-command-is "git config --global alias.${name} !sh -c ${value}" $LINENO
}

function test_gx_git_config_aliases_help() {
  local count_lines=$(gx_git_config_aliases_help | wc -l)
  assert equals "${count_lines}" "51" $LINENO

  assert first-line   "$(gx_git_config_aliases_help)"   "${TEST_C_WHITE}  # Git aliases (DISABLED)${TEST_F_RESET} :" $LINENO
  assert last-line    "$(gx_git_config_aliases_help)"   "           stats | git ${TEST_C_LIGHT_BLUE}contributors${TEST_F_RESET} ${TEST_C_DARK_GRAY}................${TEST_F_RESET} Get the list of contributors for the current repository" $LINENO
}

function test_gx_hooks_pcmsg_print_type() {
  assert equals "$(gx_hooks_pcmsg_print_type "${C_GREEN}" "t" "a" "short description")"                      " ${TEST_C_GREEN}a${TEST_F_RESET} ${TEST_C_DARK_GRAY}..........${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "a" "short description")"                   " ${TEST_C_BLUE}a${TEST_F_RESET}ype ${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_GREEN}"  "typetoooooolong" "a" "short description")"       " ${TEST_C_GREEN}a${TEST_F_RESET}ypetoooooolong ${TEST_C_DARK_GRAY}${TEST_F_RESET} short description" $LINENO

  assert equals "$(gx_hooks_pcmsg_print_type "${C_GREEN}"  "type" "a" "short description")"                  " ${TEST_C_GREEN}a${TEST_F_RESET}ype ${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "ab" "short description")"                  " ${TEST_C_BLUE}ab${TEST_F_RESET}pe ${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type" "short description")"                " ${TEST_C_BLUE}type${TEST_F_RESET} ${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO

  # TODO(#93) : not a good behavior with too long shorcut
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type_" "short description")"               " ${TEST_C_BLUE}type_${TEST_F_RESET}${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  #assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type___" "short description")"             " ${TEST_C_BLUE}type___${TEST_F_RESET}${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type___" "short description")"             " ${TEST_C_BLUE}type___${TEST_F_RESET}33[90m.......${TEST_F_RESET} short description" $LINENO
  #assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type______" "short description")"          " ${TEST_C_BLUE}type______${TEST_F_RESET}${TEST_C_DARK_GRAY}.......${TEST_F_RESET} short description" $LINENO
  assert equals "$(gx_hooks_pcmsg_print_type "${C_BLUE}"  "type" "type______" "short description")"          " ${TEST_C_BLUE}type______${TEST_F_RESET}90m.......${TEST_F_RESET} short description" $LINENO
}

function test_gx_print_col_fixed_width() {
  assert equals "$(gx_print_col_fixed_width 0 "")"            " " $LINENO
  assert equals "$(gx_print_col_fixed_width 0 "a")"           "a" $LINENO
  assert equals "$(gx_print_col_fixed_width 0 1)"             "1" $LINENO

  assert equals "$(gx_print_col_fixed_width 4 "")"            "    " $LINENO
  assert equals "$(gx_print_col_fixed_width 4 "a")"           "a   " $LINENO
  assert equals "$(gx_print_col_fixed_width 4 "abcd")"        "abcd" $LINENO
  assert equals "$(gx_print_col_fixed_width 4 "abcdef")"      "abcdef" $LINENO

  assert equals "$(gx_print_col_fixed_width 8 "")"            "        " $LINENO
  assert equals "$(gx_print_col_fixed_width 8 "a")"           "a       " $LINENO
  assert equals "$(gx_print_col_fixed_width 8 "abcd")"        "abcd    " $LINENO
  assert equals "$(gx_print_col_fixed_width 8 "abcdefghi")"   "abcdefghi" $LINENO

  assert equals "$(gx_print_col_fixed_width 8 1)"             "1       " $LINENO
  assert equals "$(gx_print_col_fixed_width 8 1234)"          "1234    " $LINENO
  assert equals "$(gx_print_col_fixed_width 8 123456789)"     "123456789" $LINENO
}
