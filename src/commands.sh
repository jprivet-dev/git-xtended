#!/usr/bin/env bash

# Alias of gbw_command_parse_action
function gbw {
    gbw_command_parse_action "$@"
}

function gbw_command_parse_action {
    local action=$1
    shift

    case $action in
        aliases)
            gbw_command_config_git_aliases "$@"
        ;;
        help)
            gbw_command_help
        ;;
        githooks)
            gbw_command_githooks "$@"
        ;;
        *)
            echo "Unknow action '$action'"
            return
        ;;
    esac
}

function gbw_command_help {
    gbw_prompt_show_info_and_explanations
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