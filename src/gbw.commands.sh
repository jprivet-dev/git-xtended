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
        info)
            gbw_prompt_show_info_and_explanations
        ;;
        install)
            gbw_command_install "$@"
        ;;
        *)
            echo "Unknow action '$action'"
            return
        ;;
    esac
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


function gbw_command_install {
    local current_dir="$PWD"
    local gbw_hooks_pcm="$GBW_ROOT/git/hooks/prepare-commit-msg"
    local current_dir_hooks_pcm="$current_dir/.git/hooks/prepare-commit-msg"
    local symlink_command_create="$ ln -s $gbw_hooks_pcm $current_dir_hooks_pcm"
    local symlink_command_delete="$ rm $current_dir_hooks_pcm"

    echo -e "$C_LIGHT_GREEN"
    echo -e "##################################"
    echo -e "# Git Bash Workflow installation #"
    echo -e "##################################"
    echo -e "$F_RESET"

    echo "Active prepare-commit-msg :"
    echo "$symlink_command_create"
    echo

    echo "Delete prepare-commit-msg :"
    echo "$symlink_command_delete"
}