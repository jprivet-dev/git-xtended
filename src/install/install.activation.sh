#!/usr/bin/env bash

function gbw_install_activation {
    gbw_install_choice_params_set_all_from_git_config

    [ "${GBW_PARAMS_INSTALL_PROMPT_STATUS}" == "${GBW_PARAMS_ENABLED}" ]         && gbw_prompt_enabled
    [ "${GBW_PARAMS_INSTALL_GIT_ALIASES_STATUS}" == "${GBW_PARAMS_ENABLED}" ]    && gbw_git_aliases_enabled           || gbw_git_aliases_disabled
    [ "${GBW_PARAMS_INSTALL_GIT_HOOKS_STATUS}" == "${GBW_PARAMS_ENABLED}" ]      && gbw_git_config_hooks_enabled      || gbw_git_config_hooks_disabled
    [ "${GBW_PARAMS_INSTALL_WORKFLOW_STATUS}" == "${GBW_PARAMS_ENABLED}" ]       && gbw_git_config_workflow_enabled   || gbw_git_config_workflow_disabled
    [ "${GBW_PARAMS_INSTALL_BASH_ALIASES_STATUS}" == "${GBW_PARAMS_ENABLED}" ]   && gbw_bash_aliases_enabled          || gbw_bash_aliases_disabled
}

function gbw_install_activation_status_color {
    [ "$1" == "${GBW_PARAMS_ENABLED}" ] && echo "${GBW_PARAMS_ENABLED_C}" || echo "${GBW_PARAMS_DISABLED_C}"
}

function gbw_install_activation_show_status {
    gbw_install_choice_params_set_all_from_git_config

    local gbw_prompt_status="`gbw_install_activation_status_color ${GBW_PARAMS_INSTALL_PROMPT_STATUS}`"
    local gbw_git_aliases_status="`gbw_install_activation_status_color ${GBW_PARAMS_INSTALL_GIT_ALIASES_STATUS}`"
    local gbw_git_hooks_status="`gbw_install_activation_status_color ${GBW_PARAMS_INSTALL_GIT_HOOKS_STATUS}`"
    local gbw_workflow_status="`gbw_install_activation_status_color ${GBW_PARAMS_INSTALL_WORKFLOW_STATUS}`"
    local gbw_bash_aliases_status="`gbw_install_activation_status_color ${GBW_PARAMS_INSTALL_BASH_ALIASES_STATUS}`"

    local line_info="@info ${GBW_PARAMS_GITHUB}"
    local col_width=${#line_info}
    local space=" "

    local line=`gbw_print_fixed_width $col_width "-" "" ""`

    cat ~/git-bash-workflow/src/logo/logo.txt
    echo

    echo
    gbw_print_fixed_width $col_width "${space}" "" "${GBW_PARAMS_VERSION}"
    echo "${line}"

    echo "${line_info}"
    echo "${line}"

    gbw_print_fixed_width -e $col_width "${space}" "${GBW_PARAMS_LABEL_PROMPT}"        "${gbw_prompt_status}"
    gbw_print_fixed_width -e $col_width "${space}" "${GBW_PARAMS_LABEL_GIT_ALIASES}"   "${gbw_git_aliases_status}"
    gbw_print_fixed_width -e $col_width "${space}" "${GBW_PARAMS_LABEL_GIT_HOOKS}"     "${gbw_git_hooks_status}"
    gbw_print_fixed_width -e $col_width "${space}" "${GBW_PARAMS_LABEL_WORKFLOW}"      "${gbw_workflow_status}"
    gbw_print_fixed_width -e $col_width "${space}" "${GBW_PARAMS_LABEL_BASH_ALIASES}"  "${gbw_bash_aliases_status}"

    echo "${line}"
    echo

#    echo "git config ..."
#    echo "${GBW_PARAMS_TAB}user.name  = `git config user.name`"
#    echo "${GBW_PARAMS_TAB}user.email = `git config user.email`"
#    echo
#
#    echo "git config --global ..."
#    echo "${GBW_PARAMS_TAB}user.name  = `git config --global user.name`"
#    echo "${GBW_PARAMS_TAB}user.email = `git config --global user.email`"
#    echo
#
#    echo "${line}"
#    echo
}
