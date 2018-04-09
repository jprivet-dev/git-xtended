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

    echo -e "${C_LIGHT_GREEN}"
    echo -e "################################"
    echo -e "# ${GBW_PARAMS_TITLE} - Githooks #"
    echo -e "################################"
    echo -e "${F_RESET}"

    echo "Active prepare-commit-msg :"
    echo "${pcm_symlink_command_create}"
    echo "${pcm_symlink_command_create_ls}"
    echo

    echo "Delete prepare-commit-msg :"
    echo "${pcm_symlink_command_delete}"
    echo

    echo "Use git config core.hooksPath (enable=${config_hookspath_available}):"

    if [[ "${config_hookspath_available}" == "${GBW_PARAMS_FALSE}" ]]; then
        echo -e "${C_RED}WARNING : core.hooksPath NOT AVAILABLE !${F_RESET}"
        echo "Git min version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} required (Git current version `gbw_git_get_current_version`)"
    fi
}