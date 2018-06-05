#!/usr/bin/env bash

function gx_prompt_time {
    echo $(gx_prompt_time_colors "\t")
}

function gx_prompt_time_colors {
    local time=$1
    echo "${C_LIGHT_RED}${time}${F_RESET}"
}

function gx_prompt_user {
    echo $(gx_prompt_user_colors "${GX_PARAMS_USER_PS1}")
}

function gx_prompt_user_colors {
    local user=$1
    echo "${C_LIGHT_GREEN}${user}${F_RESET}"
}

function gx_prompt_host {
    echo $(gx_prompt_host_colors "\h")
}

function gx_prompt_host_colors {
    local host=$1
    echo "${C_LIGHT_GREEN}${host}${F_RESET}"
}

function gx_prompt_userhost {
    echo $(gx_prompt_userhost_colors "$(gx_prompt_user)" "$(gx_prompt_host)")
}

function gx_prompt_userhost_colors {
    local user=$1
    local host=$2
    echo "${user}${C_LIGHT_GREEN}@${F_RESET}${host}"
}

function gx_prompt_dir {
    echo "${C_CYAN}\\w${F_RESET}"
}

function gx_prompt_username_branch {
    echo $(gx_prompt_username_branch_colors "$(gx_git_get_current_user_name)" "$(gx_git_get_current_branch)")
}

function gx_prompt_username_branch_colors {
    local username=$1
    local branch=$2
    echo "${C_LIGHT_MAGENTA}${username}(${F_RESET}${C_LIGHT_YELLOW}${branch}${F_RESET}${C_LIGHT_MAGENTA})${F_RESET}"
}

function gx_prompt_branch {
    echo $(gx_prompt_branch_colors "$(gx_git_get_current_branch)")
}

function gx_prompt_branch_colors {
    local branch=$1
    echo "${C_LIGHT_YELLOW}(${branch})${F_RESET}"
}

function gx_prompt_changes_count {
    echo $(gx_prompt_changes_count_colors "$(gx_git_get_changes_nb)")
}

function gx_prompt_changes_count_colors {
    local count=$1
    echo "${C_LIGHT_MAGENTA}${count}≡${F_RESET}"
}

function gx_prompt_status_to_be_commited {
    local m="$(gx_git_get_status_changes_to_be_committed_modified_extended_count)"
    local n="$(gx_git_get_status_changes_to_be_committed_new_file_count)"
    local d="$(gx_git_get_status_changes_to_be_committed_deleted_count)"

    echo $(gx_prompt_status_to_be_commited_colors "${m}" "${n}" "${d}")
}

function gx_prompt_status_to_be_commited_colors {
    local format_c="${C_LIGHT_GREEN}"

    local m=$1
    local n=$2
    local d=$3

    [[ "${m}${n}${d}" == "000" ]] \
        && format_c="${C_DARK_GRAY}"

    echo "${format_c}c(${m} +${n} -${d})${F_RESET}"
}

function gx_prompt_status_not_staged {
    local count="$(gx_git_get_status_changes_not_staged_for_commit_count)"
    echo $(gx_prompt_status_not_staged_colors "${count}")
}

function gx_prompt_status_not_staged_colors {
    local count=$1
    local format="${C_DARK_GRAY}"

    [[ "${count}" > 0 ]] \
        && format="${C_LIGHT_RED}"

    echo "${format}${count}!${F_RESET}"
}

function gx_prompt_status_untracked {
    local count="$(gx_git_get_status_untracked_files_count)"
    echo $(gx_prompt_status_untracked_colors "${count}")
}

function gx_prompt_status_untracked_colors {
    local count=$1
    local format="${C_DARK_GRAY}"

    [[ "${count}" > 0 ]] \
        && format="${C_LIGHT_RED}"

    echo "${format}${count}?${F_RESET}"
}

function gx_prompt_status {
    echo "$(gx_prompt_status_untracked) $(gx_prompt_status_not_staged) $(gx_prompt_status_to_be_commited)"
}

function gx_prompt_behind {
    local count="$(gx_git_status_behind_count $(gx_git_get_current_branch) $(gx_git_get_remote_branch_ref))"
    echo $(gx_prompt_behind_colors "${count}")
}

function gx_prompt_behind_colors {
    local count=$1
    local format="${C_LIGHT_GRAY}"

    if [[ -z "${count}" ]]; then
        count="x"
        format="${C_LIGHT_RED}"
    fi

    echo "${format}${count}↓${F_RESET}"
}

function gx_prompt_ahead {
    local count="$(gx_git_status_ahead_count $(gx_git_get_current_branch) $(gx_git_get_remote_branch_ref))"
    echo $(gx_prompt_ahead_colors "${count}")
}

function gx_prompt_ahead_colors {
    local count=$1
    local format="${C_LIGHT_GRAY}"

    if [[ -z "${count}" ]]; then
        count="x"
        format="${C_LIGHT_RED}"
    fi

    echo "${format}${count}↑${F_RESET}"
}

function gx_prompt_ps1_part1 {
    local ps1="$(gx_prompt_time) $(gx_prompt_userhost):$(gx_prompt_dir)"

    if [[ -d "$(gx_git_current_folder_is_repo)" ]]; then
        ps1="${ps1} $(gx_prompt_username_branch)"

        if [[ "$(gx_git_get_changes_nb)" != 0 ]]; then
            ps1="${ps1} $(gx_prompt_changes_count) $(gx_prompt_status)"
        fi

        ps1="${ps1} $(gx_prompt_behind) $(gx_prompt_ahead)"
    fi

    echo "${ps1}"
}

function gx_prompt_ps1_part2 {
    local ps2="${F_RESET}\n"
    ps2="${ps2}\$ "
    echo "${ps2}"
}

function gx_prompt_set_ps1 {
    PS1="$(gx_prompt_ps1_part1)$(gx_prompt_ps1_part2)"
}

function gx_prompt_set_ps2 {
    PS2="${C_CYAN}>"
}

function gx_prompt_enabled {
    if [[ "$(gx_is_bash_interactive)" == "false" ]]; then
        return
    fi
    PROMPT_COMMAND='gx_prompt_set_ps1'
    gx_prompt_set_ps2
}

