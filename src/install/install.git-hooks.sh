#!/usr/bin/env bash

function gbw_install_git_hooks {
    local hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_install_git_hooks_corehookspath_create
        return
    fi

    gbw_install_git_hooks_corehookspath_remove
    gbw_install_git_hooks_symlink
}

function gbw_install_git_hooks_corehookspath_create {
    gbw_print_step "'git config core.hooksPath' available"
    gbw_print_question_yes_no "Create hooks symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        gbw_git_config_hooks_enabled
        gbw_print_step "Symlink created"
        return
    fi

    gbw_print_step "core.hooksPath = `gwb_git_config_get "core.hooksPath"`"
}

function gbw_install_git_hooks_corehookspath_remove {
    gbw_print_step "'git config core.hooksPath' NOT available ! Git version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} is at least required (current version: `gbw_git_get_current_version`)"
    gbw_git_config_hooks_disabled
}

function gbw_install_git_hooks_symlink {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"

    if [[ "`gbw_symlink_exists "$current_hooks_prepare_commit_msg_path"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_print_step "Symlink allready exists (${current_hooks_prepare_commit_msg_path})"
        gbw_install_git_hooks_symlink_remove "${current_hooks_prepare_commit_msg_path}"
        return
    fi

    gbw_install_git_hooks_symlink_create "${current_hooks_prepare_commit_msg_path}"
}

function gbw_install_git_hooks_symlink_create {
    local current_hooks_prepare_commit_msg_path="${1}"
    local command_create_symlink="ln -sf ${GBW_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH} ${current_hooks_prepare_commit_msg_path}"

    gbw_print_step "Create hooks symlink instead ($ ${command_create_symlink})"
    gbw_print_question_yes_no "Create symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        eval "${command_create_symlink}"
        gbw_print_step "Symlink created"
        return
    fi

    gbw_print_step "Symlink does not create !"
}

function gbw_install_git_hooks_symlink_remove {
    local current_hooks_prepare_commit_msg_path="${1}"
    local command_symlink_remove="rm ${current_hooks_prepare_commit_msg_path}"

    gbw_print_question_yes_no "Remove hooks symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        eval "${command_symlink_remove}"
        gbw_print_step "Symlink removed"
        return
    fi

    gbw_print_step "Symlink does not remove !"
}