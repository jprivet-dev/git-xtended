#!/usr/bin/env bash

function gbw_install_git_hooks {
    local current_dir="${PWD}"
    local gbw_pcm="${GBW_PARAMS_ROOT}/git/hooks/prepare-commit-msg"
    local current_dir_hooks="${current_dir}/.git/hooks"
    local current_dir_hook_pcm="${current_dir_hooks}/prepare-commit-msg"

    local pcm_symlink_command_create="ln -sf ${gbw_pcm} ${current_dir_hook_pcm}"
    local pcm_symlink_command_create_ls="ls ${current_dir_hooks}"
    local pcm_symlink_command_delete="rm ${current_dir_hook_pcm}"

    local hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_print_step "'git config core.hooksPath' available"
        return
    fi

    gbw_print_step "'git config core.hooksPath' NOT available ! Git version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} is at least required (current version: `gbw_git_get_current_version`)"
    gbw_print_step "Create symlink instead ($ ${pcm_symlink_command_create})"

    if [[ "`gbw_symlink_exists "$current_dir_hook_pcm"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_print_step "Symlink allready exists"
        gbw_print_question_yes_no "Remove hooks symlink"

        if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
            gbw_print_step "Symlink removed"
            eval "${pcm_symlink_command_delete}"
            return
        fi

        gbw_print_step "Symlink does not remove !"
        return
    fi

    gbw_print_question_yes_no "Create hooks symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        gbw_print_step "Symlink created"
        eval "${pcm_symlink_command_create}"
        return
    fi

    gbw_print_step "Symlink does not create !"
    return
}