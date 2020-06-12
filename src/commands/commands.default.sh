#!/usr/bin/env bash

# Alias of gx_command_parse_action
function gx() {
    gx_command_parse_action "$@"
}

function gx_command_parse_action() {
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

    echo "[ERROR] 'gx ${action}' : unknow action"
}

function gx_command_action_config() {
    git config --list | grep ${GX_PARAMS_GIT_CONFIG_KEY_ROOT}
}

function gx_command_action_install() {
    gx_print_title_1 "${GX_PARAMS_TITLE} install (Global configuration)"

    gx_install_choice
    gx_install_activation
    gx_install_activation_show_status
}

function gx_command_action_status() {
    gx_install_activation_show_status
}

function gx_command_action_help() {
    gx_install_activation_show_status
    gx_prompt_help
    gx_git_config_aliases_help
    gx_command_help
}

function gx_command_action_colors() {
    gx_colors_print_all
}

function gx_command_action_test() {
    source ~/git-xtended/gx.tests.sh
}

function gx_command_action_aliases() {
    gx_command_config_git_aliases "$@"
}

function gx_command_action_reload() {
    eval "source ${GX_PARAMS_GX_SH}"
}

function gx_command_config_git_aliases() {
    local global=""
    local unset=""
    local i

    for i in "$@"; do
        case $i in
        -g | --global)
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
