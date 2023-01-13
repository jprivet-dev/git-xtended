#!/usr/bin/env bash

function gx_prompt_time() {
  echo $(gx_prompt_time_colors "\t")
}

function gx_prompt_time_colors() {
  local time=$1
  echo "${GX_PARAMS_PROMPT_TIME_COLORS}${time}${F_RESET}"
}

function gx_prompt_user() {
  echo $(gx_prompt_user_colors "${GX_PARAMS_USER_PS1}")
}

function gx_prompt_user_colors() {
  local user=$1
  echo "${GX_PARAMS_PROMPT_USER_COLORS}${user}${F_RESET}"
}

function gx_prompt_host() {
  echo $(gx_prompt_host_colors "\h")
}

function gx_prompt_host_colors() {
  local host=$1
  echo "${GX_PARAMS_PROMPT_HOST_COLORS}${host}${F_RESET}"
}

function gx_prompt_userhost() {
  echo $(gx_prompt_userhost_colors "$(gx_prompt_user)" "$(gx_prompt_host)")
}

function gx_prompt_userhost_colors() {
  local user=$1
  local host=$2
  echo "${user}${GX_PARAMS_PROMPT_USERHOST_COLORS}@${F_RESET}${host}"
}

function gx_prompt_dir() {
  echo "${GX_PARAMS_PROMPT_DIR_COLORS}\\w${F_RESET}"
}

function gx_prompt_username_branch() {
  echo $(gx_prompt_username_branch_colors "$(gx_git_get_current_username)" "$(gx_git_get_current_branch)")
}

function gx_prompt_username_branch_colors() {
  local username=$1
  local branch=$2
  echo "${GX_PARAMS_PROMPT_USERNAME_COLORS}${username}(${F_RESET}${GX_PARAMS_PROMPT_BRANCH_COLORS}${branch}${F_RESET}${GX_PARAMS_PROMPT_USERNAME_COLORS})${F_RESET}"
}

function gx_prompt_changes_count() {
  echo $(gx_prompt_changes_count_colors "$(gx_git_get_changes_nb)")
}

function gx_prompt_changes_count_colors() {
  local count=$1
  echo "${GX_PARAMS_PROMPT_CHANGES_COUNT_COLORS}${count}≡${F_RESET}"
}

function gx_prompt_status_to_be_commited() {
  local m=$(gx_git_get_status_changes_to_be_committed_modified_extended_count)
  local n=$(gx_git_get_status_changes_to_be_committed_new_file_count)
  local d=$(gx_git_get_status_changes_to_be_committed_deleted_count)

  echo $(gx_prompt_status_to_be_commited_colors "${m}" "${n}" "${d}")
}

function gx_prompt_status_to_be_commited_colors() {
  local format_c="${GX_PARAMS_PROMPT_STATUS_TO_BE_COMMITED_COLORS_ON}"

  local m=$1
  local n=$2
  local d=$3

  [[ "${m}${n}${d}" == "000" ]] &&
    format_c="${GX_PARAMS_PROMPT_STATUS_TO_BE_COMMITED_COLORS_OFF}"

  echo "${format_c}c(${m} +${n} -${d})${F_RESET}"
}

function gx_prompt_status_not_staged() {
  local count=$(gx_git_get_status_changes_not_staged_for_commit_count)
  echo $(gx_prompt_status_not_staged_colors "${count}")
}

function gx_prompt_status_not_staged_colors() {
  local count="$1"
  local format="${GX_PARAMS_PROMPT_STATUS_NOT_STAGED_COLORS}"

  [[ "${count}" > 0 ]] &&
    format="${GX_PARAMS_PROMPT_STATUS_NOT_STAGED_COLORS_ERROR}"

  echo "${format}${count}!${F_RESET}"
}

function gx_prompt_status_untracked() {
  local count=$(gx_git_get_status_untracked_files_count)
  echo $(gx_prompt_status_untracked_colors "${count}")
}

function gx_prompt_status_untracked_colors() {
  local count="$1"
  local format="${GX_PARAMS_PROMPT_STATUS_UNTRACKED_COLORS}"

  [[ "${count}" > 0 ]] &&
    format="${GX_PARAMS_PROMPT_STATUS_UNTRACKED_COLORS_ERROR}"

  echo "${format}${count}?${F_RESET}"
}

function gx_prompt_status() {
  echo "$(gx_prompt_status_untracked) $(gx_prompt_status_not_staged) $(gx_prompt_status_to_be_commited)"
}

function gx_prompt_behind() {
  local current_branch=$(gx_git_get_current_branch)
  local remote_ref_branch=$(gx_git_get_remote_ref_branch)
  local count=""

  [[ -n "${remote_ref_branch}" ]] &&
    count=$(gx_git_status_behind_count "${current_branch}" "${remote_ref_branch}")

  echo $(gx_prompt_behind_colors "${count}")
}

function gx_prompt_behind_colors() {
  local count=$1
  local format="${GX_PARAMS_PROMPT_BEHIND_COLORS_ON}"

  if [[ -z "${count}" ]]; then
    count="x"
    format="${GX_PARAMS_PROMPT_BEHIND_COLORS_ERROR}"
  fi

  [[ "${count}" == 0 ]] &&
    format="${GX_PARAMS_PROMPT_BEHIND_COLORS_OFF}"

  echo "${format}${count}↓${F_RESET}"
}

function gx_prompt_ahead() {
  local current_branch=$(gx_git_get_current_branch)
  local remote_ref_branch=$(gx_git_get_remote_ref_branch)
  local count=""

  if [[ -n "${remote_ref_branch}" ]]; then
    count=$(gx_git_status_ahead_count "${current_branch}" "${remote_ref_branch}")
  fi

  echo $(gx_prompt_ahead_colors "${count}")
}

function gx_prompt_ahead_colors() {
  local count="$1"
  local format="${GX_PARAMS_PROMPT_AHEAD_COLORS_ON}"

  if [[ -z "${count}" ]]; then
    count="x"
    format="${GX_PARAMS_PROMPT_AHEAD_COLORS_ERROR}"
  fi

  [[ "${count}" == 0 ]] &&
    format="${GX_PARAMS_PROMPT_AHEAD_COLORS_OFF}"

  echo "${format}${count}↑${F_RESET}"
}

function gx_prompt_warning() {
  local current_branch=$(gx_git_get_current_branch)
  local remote_ref_branch=$(gx_git_get_remote_ref_branch)
  local behind_count=""
  local changes_count="$(gx_git_get_changes_nb)"
  local message=""

  [[ -n "${remote_ref_branch}" ]] &&
    behind_count=$(gx_git_status_behind_count "${current_branch}" "${remote_ref_branch}")

  [[ 
    "${behind_count}" == "x" ||
    "${behind_count}" -gt "${GX_PARAMS_PROMPT_WARNING_BEHIND_COUNT_MIN}" ||
    "${changes_count}" -ge "${GX_PARAMS_PROMPT_WARNING_CHANGES_COUNT_MAX}" ]] &&
    message="${GX_PARAMS_PROMPT_WARNING_ICON}"

  echo $(gx_prompt_warning_colors "${message}")
}

function gx_prompt_warning_colors() {
  echo "${GX_PARAMS_PROMPT_WARNING_COLORS}${1} ${F_RESET}"
}

function gx_prompt_ps1_part1() {
  local ps1="$(gx_prompt_time) $(gx_prompt_userhost):$(gx_prompt_dir)"

  if [[ -d "$(gx_git_current_folder_is_repo)" ]]; then
    ps1="${ps1} $(gx_prompt_username_branch)"

    if [[ "$(gx_git_get_changes_nb)" != 0 ]]; then
      ps1="${ps1} $(gx_prompt_changes_count) $(gx_prompt_status)"
    fi

    ps1="${ps1} $(gx_prompt_behind) $(gx_prompt_ahead) $(gx_prompt_warning)"
  fi

  echo "${ps1}"
}

function gx_prompt_ps1_part2() {
  local ps2="${F_RESET}\n"
  ps2="${ps2}\$ "
  echo "${ps2}"
}

function gx_prompt_set_ps1() {
  PS1="$(gx_prompt_ps1_part1)$(gx_prompt_ps1_part2)"
}

function gx_prompt_set_ps2() {
  PS2="${GX_PARAMS_PROMPT_SET_PS2_COLORS}>"
}

function gx_prompt_enabled() {
  if [[ "$(gx_is_bash_interactive)" == "false" ]]; then
    return
  fi
  PROMPT_COMMAND="gx_prompt_set_ps1"
  gx_prompt_set_ps2
}

function gx_prompt_disabled() {
  PS1=${GX_PARAMS_INSTALL_OLD_PS1}
  PS2=${GX_PARAMS_INSTALL_OLD_PS2}
  PROMPT_COMMAND=${GX_PARAMS_INSTALL_OLD_PROMPT_COMMAND}
}
