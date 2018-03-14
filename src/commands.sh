#!/usr/bin/env bash

# Alias of gbw_command_parse_action
function gbw {
    gbw_command_parse_action "$@"
}

function gbw_command_parse_action {
    local action=$1
    shift

    if [ "$action" == "" ]; then
        gbw_command_action_help
        return
    fi

    local func_name="gbw_command_action_$action"

    if type "$func_name" &>/dev/null; then
        $func_name "$@"
        return
    fi

    echo "[ERROR] 'gbw $action' : unknow action"
}

function gbw_command_action_install {
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
            echo "Unknown option '$i'"
            return
        ;;
    esac
    done

    if [[ "$unset" == "--unset" ]]; then
        gbw_git_config_unset_aliases $global
    else
        gbw_git_config_set_aliases $global
    fi
}

function gbw_command_githooks {
    local current_dir="$PWD"
    local gbw_pcm="$GBW_PARAMS_ROOT/git/hooks/prepare-commit-msg"
    local current_dir_hooks="$current_dir/.git/hooks"
    local current_dir_hook_pcm="$current_dir_hooks/prepare-commit-msg"

    local pcm_symlink_command_create="$ ln -sf $gbw_pcm $current_dir_hook_pcm"
    local pcm_symlink_command_create_ls="$ ls $current_dir_hooks"
    local pcm_symlink_command_delete="$ rm $current_dir_hook_pcm"

    echo -e "$C_LIGHT_GREEN"
    echo -e "################################"
    echo -e "# $GBW_PARAMS_TITLE - Githooks #"
    echo -e "################################"
    echo -e "$F_RESET"

    echo "Active prepare-commit-msg :"
    echo "$pcm_symlink_command_create"
    echo "$pcm_symlink_command_create_ls"
    echo

    echo "Delete prepare-commit-msg :"
    echo "$pcm_symlink_command_delete"
    echo
}