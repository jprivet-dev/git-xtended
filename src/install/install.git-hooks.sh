#!/usr/bin/env bash

function gbw_install_git_hooks {
    local status=$1
    local hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_install_git_hooks_corehookspath_available "${status}"
        return
    fi

    gbw_install_git_hooks_corehookspath_not_available "${status}"
}

function gbw_install_git_hooks_corehookspath_available {
    local status=$1

    if [[ "${status}" == "${GBW_PARAMS_ENABLED}" ]]; then
        gbw_install_git_hooks_corehookspath_create
        return
    fi

    gbw_install_git_hooks_corehookspath_remove
}

function gbw_install_git_hooks_corehookspath_not_available {
    local status=$1

    gbw_print_step "'git config core.hooksPath' NOT available ! Git version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} is at least required (current version: `gbw_git_get_current_version`)"

    if [[ "${status}" == "${GBW_PARAMS_ENABLED}" ]]; then
        gbw_install_git_hooks_symlink_create
        return
    fi
    
    gbw_install_git_hooks_symlink_remove
}

function gbw_install_git_hooks_corehookspath_create {
    gbw_print_step "'git config core.hooksPath' available"
    gbw_print_question_yes_no "Set core.hooksPath"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        gbw_git_config_hooks_enabled
        gbw_print_step "core.hooksPath = `gwb_git_config_get "core.hooksPath"`"
    fi
}

function gbw_install_git_hooks_corehookspath_remove {
    echo "TODO: remove corehookspath"
}

function gbw_install_git_hooks_symlink {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"

    if [[ "`gbw_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_print_step "Symlink allready exists (${current_hooks_prepare_commit_msg_path})"
        gbw_install_git_hooks_symlink_remove "${current_hooks_prepare_commit_msg_path}"
        return
    fi

    gbw_install_git_hooks_symlink_create "${current_hooks_prepare_commit_msg_path}"
}

function gbw_install_git_hooks_symlink_create {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"
    local command_create_symlink="ln -sf ${GBW_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH} ${current_hooks_prepare_commit_msg_path}"

    gbw_print_step "Create hooks symlink instead ($ ${command_create_symlink})"

    if [[ "`gbw_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' already exists"
        return
    else
        gbw_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' does not exist"
    fi

    eval "${command_create_symlink}"
    gbw_print_step "Symlink created"
}

function gbw_install_git_hooks_symlink_remove {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"
    local command_symlink_remove="rm ${current_hooks_prepare_commit_msg_path}"

    gbw_print_step "Remove hooks symlink ($ ${command_symlink_remove})"
    
    if [[ "`gbw_symlink_exists "${current_hooks_prepare_commit_msg_path}"`" == "${GBW_PARAMS_FALSE}" ]]; then
        gbw_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' does not exist"
        return
    else
        gbw_print_step "Symlink '${current_hooks_prepare_commit_msg_path}' exists"
    fi

    eval "${command_symlink_remove}"
    gbw_print_step "Symlink removed"
}