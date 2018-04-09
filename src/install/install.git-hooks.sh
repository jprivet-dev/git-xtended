#!/usr/bin/env bash

function gbw_install_git_hooks {
    local current_dir="${PWD}"
    local gbw_pcm="${GBW_PARAMS_ROOT}/git/hooks/prepare-commit-msg"
    local current_dir_hooks="${current_dir}/.git/hooks"
    local current_dir_hook_pcm="${current_dir_hooks}/prepare-commit-msg"

    local pcm_symlink_command_create="$ ln -sf ${gbw_pcm} ${current_dir_hook_pcm}"
    local pcm_symlink_command_create_ls="$ ls ${current_dir_hooks}"
    local pcm_symlink_command_delete="$ rm ${current_dir_hook_pcm}"

    local hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    echo "hookspath_available = $hookspath_available"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_install_git_hooks_hookspath
        return
    fi

    gbw_install_git_hooks_hookspath_nok

    gbw_install_git_hooks_symlink
}

function gbw_install_git_hooks_symlink {
    echo "${GBW_PARAMS_TAB}Option [1]: create symlink"
    echo "${GBW_PARAMS_TAB_2}${pcm_symlink_command_create}"
}

function gbw_install_git_hooks_hookspath {
    gbw_print_step "'git config core.hooksPath' available"
}

function gbw_install_git_hooks_hookspath_nok {
    gbw_print_step "'git config core.hooksPath' NOT available !"
}