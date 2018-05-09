#!/usr/bin/env bash

# Alias of gx_command_parse_action
function gbw {
    gx_command_parse_action "$@"
}

function gx_command_parse_action {
    local action=$1
    shift

    if [ "${action}" == "" ]; then
        gx_command_action_help
        return
    fi

    local func_name="gx_command_action_${action}"

    if type "${func_name}" &>/dev/null; then
        $func_name "$@"
        return
    fi

    echo "[ERROR] 'gbw ${action}' : unknow action"
}

function gx_command_action_config {
    git config --list | grep ${GBW_PARAMS_GIT_CONFIG_KEY_ROOT}
}

function gx_command_action_install {
    gx_print_title_1 "${GBW_PARAMS_TITLE} INSTALL"

    gx_install_choice
    gx_install_activation
    gx_install_activation_show_status
}

function gx_command_action_status {
    gx_install_activation_show_status
}

function gx_command_action_help {
    gx_install_activation_show_status
    gx_prompt_help
    gx_git_config_aliases_help
    gx_git_config_hooks_help
    gx_git_config_workflow_help
    gx_bash_aliases_help
    gx_command_help
}

function gx_command_action_colors {
    gx_colors_print_all
}

function gx_command_action_test {
    source ~/git-xtended/gx.tests.sh
}

function gx_command_action_githooks {
    gx_command_githooks
}

function gx_command_action_aliases {
    gx_command_config_git_aliases "$@"
}

function gx_command_action_reload {
    eval "source ${GBW_PARAMS_GBW_SH}"
}

function gx_command_config_git_aliases {
    local global=""
    local unset=""
    local i

    for i in "$@"
    do
    case $i in
        -g|--global)
            global="--global"
        ;;
        --unset)
            unset="--unset"
        ;;
        *)
            echo "Unknown option '${i}'"
            return
        ;;
    esac
    done

    if [[ "${unset}" == "--unset" ]]; then
        gx_git_config_unset_aliases $global
    else
        gx_git_config_set_aliases $global
    fi
}

# TODO: to remove
function gx_command_githooks {
    echo "Removed"
}