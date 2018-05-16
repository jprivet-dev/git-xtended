#!/usr/bin/env bash

function gx_install_activation {
    gx_install_choice_params_set_all_from_git_config

    if [ "${GX_PARAMS_INSTALL_PROMPT_STATUS}" == "${GX_PARAMS_ENABLED}" ]
    then
        gx_prompt_enabled
    fi

    if [ "${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS}" == "${GX_PARAMS_ENABLED}" ]
    then
        gx_git_aliases_enabled
    else
        gx_git_aliases_disabled
    fi

    if [ "${GX_PARAMS_INSTALL_GIT_HOOKS_STATUS}" == "${GX_PARAMS_ENABLED}" ]
    then
        gx_git_config_hooks_enabled
    else
        gx_git_config_hooks_disabled
    fi

#    [ "${GX_PARAMS_INSTALL_WORKFLOW_STATUS}" == "${GX_PARAMS_ENABLED}" ]       && gx_git_config_workflow_enabled   || gx_git_config_workflow_disabled
#    [ "${GX_PARAMS_INSTALL_BASH_ALIASES_STATUS}" == "${GX_PARAMS_ENABLED}" ]   && gx_bash_aliases_enabled          || gx_bash_aliases_disabled
}

function gx_install_activation_status_color {
    [ "$1" == "${GX_PARAMS_ENABLED}" ] && echo "${GX_PARAMS_ENABLED_C}" || echo "${GX_PARAMS_DISABLED_C}"
}

function gx_install_activation_show_status {
    gx_install_choice_params_set_all_from_git_config

    local gx_prompt_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_PROMPT_STATUS})"
    local gx_git_aliases_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS})"
    local gx_git_hooks_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_GIT_HOOKS_STATUS})"
#    local gx_workflow_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_WORKFLOW_STATUS})"
#    local gx_bash_aliases_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_BASH_ALIASES_STATUS})"

    local line_info="- ${GX_PARAMS_GITHUB} -"
    local col_width=${#line_info}
    local space=" "

    local line=$(gx_print_fixed_width $col_width "-" "" "")

    echo
    cat ~/git-xtended/src/logo/logo.txt
    echo

    echo
    gx_print_fixed_width $col_width " " "" "${GX_PARAMS_VERSION}"


    echo "${line}"
    gx_print_fixed_width -e $col_width "${space}" "${GX_PARAMS_LABEL_PROMPT}"        "${gx_prompt_status}"
    gx_print_fixed_width -e $col_width "${space}" "${GX_PARAMS_LABEL_GIT_ALIASES}"   "${gx_git_aliases_status}"
    gx_print_fixed_width -e $col_width "${space}" "${GX_PARAMS_LABEL_GIT_HOOKS}"     "${gx_git_hooks_status}"
#    gx_print_fixed_width -e $col_width "${space}" "${GX_PARAMS_LABEL_WORKFLOW}"      "${gx_workflow_status}"
#    gx_print_fixed_width -e $col_width "${space}" "${GX_PARAMS_LABEL_BASH_ALIASES}"  "${gx_bash_aliases_status}"

    echo "${line}"
    echo "${line_info}"
    echo "${line}"
    echo

#    echo "git config ..."
#    echo "${GX_PARAMS_TAB}user.name  = $(git config user.name)"
#    echo "${GX_PARAMS_TAB}user.email = $(git config user.email)"
#    echo
#
#    echo "git config --global ..."
#    echo "${GX_PARAMS_TAB}user.name  = $(git config --global user.name)"
#    echo "${GX_PARAMS_TAB}user.email = $(git config --global user.email)"
#    echo
#
#    echo "${line}"
#    echo
}
