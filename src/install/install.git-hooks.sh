#!/usr/bin/env bash

function gbw_install_git_hooks {
    local current_dir="${PWD}"
    local gbw_pcm="${GBW_PARAMS_ROOT}/git/hooks/prepare-commit-msg"
    local current_dir_hooks="${current_dir}/.git/hooks"
    local current_dir_hook_pcm="${current_dir_hooks}/prepare-commit-msg"

    local pcm_symlink_command_create="$ ln -sf ${gbw_pcm} ${current_dir_hook_pcm}"
    local pcm_symlink_command_create_ls="$ ls ${current_dir_hooks}"
    local pcm_symlink_command_delete="$ rm ${current_dir_hook_pcm}"

    local config_hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    echo "${GBW_PARAMS_TAB}Option [1]: create symlink"
    echo "${GBW_PARAMS_TAB_2}${pcm_symlink_command_create}"

    echo "${GBW_PARAMS_TAB}Option [2]: use git config core.hooksPath"
    if [[ "${config_hookspath_available}" == "${GBW_PARAMS_FALSE}" ]]; then
        echo -e "${GBW_PARAMS_TAB_2}${C_RED}WARNING : core.hooksPath NOT AVAILABLE !${F_RESET}"
        echo "${GBW_PARAMS_TAB_2}Git min version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} required (Git current version `gbw_git_get_current_version`)"
    fi
}