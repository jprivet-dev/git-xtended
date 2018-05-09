#!/usr/bin/env bash

function gx_install_git_hooks {
    local status=$1
    local hookspath_available="$(gx_is_good_version "`gx_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    gx_print_step "'git config core.hooksPath' available from git version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} onwards"
    gx_print_step "Current git version = `gx_git_get_current_version`"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gx_install_git_hooks_corehookspath_available "${status}"
        return
    fi

    gx_install_git_hooks_corehookspath_not_available "${status}"
}

function gx_install_git_hooks_corehookspath_available {
    local status=$1

    gx_print_step "'git config core.hooksPath' is available"
    gx_git_config_hooks_set_type_hookspath

    if [[ "${status}" == "${GBW_PARAMS_ENABLED}" ]]; then
        gx_install_git_hooks_corehookspath_create
        return
    fi

    gx_install_git_hooks_corehookspath_remove
}

function gx_install_git_hooks_corehookspath_not_available {
    local status=$1

    gx_print_step "'git config core.hooksPath' is NOT available"
    gx_git_config_hooks_set_type_symlink

    if [[ "${status}" == "${GBW_PARAMS_ENABLED}" ]]; then
        gx_install_git_hooks_symlink_create
        return
    fi

    gx_install_git_hooks_symlink_remove
}

function gx_install_git_hooks_corehookspath_create {
    gx_git_config_hooks_enabled
    gx_print_step "Set core.hooksPath = `gwb_git_config_get "core.hooksPath"`"
}

function gx_install_git_hooks_corehookspath_remove {
    gx_git_config_hooks_disabled
    gx_print_step "Remove core.hooksPath configuration"
}

function gx_install_git_hooks_symlink {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"

    if [[ "`gx_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gx_print_step "Symlink allready exists (${current_hooks_prepare_commit_msg_path})"
        gx_install_git_hooks_symlink_remove "${current_hooks_prepare_commit_msg_path}"
        return
    fi

    gx_install_git_hooks_symlink_create "${current_hooks_prepare_commit_msg_path}"
}

function gx_install_git_hooks_symlink_create {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"
    local command_create_symlink="ln -sf ${GBW_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH} ${current_hooks_prepare_commit_msg_path}"

    gx_print_step "Create hooks symlink instead (execute $ ${command_create_symlink})"

    if [[ "`gx_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gx_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' already exists"
        return
    fi

    gx_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' does not exist"
    eval "${command_create_symlink}"
    gx_print_step "Symlink created"
}

function gx_install_git_hooks_symlink_remove {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"
    local command_symlink_remove="rm ${current_hooks_prepare_commit_msg_path}"

    gx_print_step "Remove hooks symlink (execute $ ${command_symlink_remove})"
    
    if [[ "`gx_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_FALSE}" ]]; then
        gx_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' does not exist"
        return
    fi

    gx_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' exists"
    eval "${command_symlink_remove}"
    gx_print_step "Symlink removed"
}