#!/usr/bin/env bash

function gx_install_activation {
    gx_install_choice_params_set_all_from_git_config

    if [ "${GX_PARAMS_INSTALL_PROMPT_STATUS}" == "${GX_PARAMS_ENABLED}" ]; then
        gx_prompt_enabled
    else
        gx_prompt_disabled
    fi

    if [ "${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS}" == "${GX_PARAMS_ENABLED}" ]; then
        gx_git_aliases_enabled
    else
        gx_git_aliases_disabled
    fi
}

function gx_install_activation_status_color {
    [ "$1" == "${GX_PARAMS_ENABLED}" ] && echo "${GX_PARAMS_ENABLED_C}" || echo "${GX_PARAMS_DISABLED_C}"
}

function gx_install_activation_show_status {
    gx_install_choice_params_set_all_from_git_config

    local gx_prompt_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_PROMPT_STATUS})"
    local gx_git_aliases_status="$(gx_install_activation_status_color ${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS})"

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

    echo "${line}"
    echo "${line_info}"
    echo "${line}"
    echo
}
