#!/usr/bin/env bash

# Alias of gbw_command_parse_action
function gbw {
    gbw_command_parse_action "$@"
}

function gbw_command_parse_action {
    local action=$1
    shift

    if [ "${action}" == "" ]; then
        gbw_command_action_help
        return
    fi

    local func_name="gbw_command_action_${action}"

    if type "${func_name}" &>/dev/null; then
        $func_name "$@"
        return
    fi

    echo "[ERROR] 'gbw ${action}' : unknow action"
}

function gbw_command_action_install {
    gbw_print_title_1 "${GBW_PARAMS_TITLE} INSTALL"

    gbw_install_choice
    gbw_install_activation
    gbw_install_activation_show_status
}

function gbw_command_action_status {
    gbw_install_activation_show_status
}

function gbw_command_action_help {
    gbw_install_activation_show_status
    gbw_prompt_help
    gbw_git_config_aliases_help
    gbw_git_config_hooks_help
    gbw_git_config_workflow_help
    gbw_bash_aliases_help
    gbw_command_help
}

function gbw_command_action_colors {
    gbw_colors_print_all
}

function gbw_command_action_test {
    source ~/git-bash-workflow/gbw.tests.sh
}

function gbw_command_action_githooks {
    gbw_command_githooks
}

function gbw_command_action_aliases {
    gbw_command_config_git_aliases "$@"
}

function gbw_command_config_git_aliases {
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
        gbw_git_config_unset_aliases $global
    else
        gbw_git_config_set_aliases $global
    fi
}

# TODO: to remove
function gbw_command_githooks {
    echo "Removed"
}