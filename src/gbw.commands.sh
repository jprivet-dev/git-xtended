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
        symlink-pcm)
            gbw_command_symlink_pcm "$@"
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


function gbw_command_symlink_pcm {
    local delete=""

    for i in "$@"
    do
    case $i in
        -d|--delete)
            delete="--delete"
        ;;
        *)
            echo "Unknown option '$i'"
            return
        ;;
    esac
    done

    if [[ "$delete" == "--delete" ]]; then
        gbw_command_symlink_pcm_delete
    else
        gbw_command_symlink_pcm_create
    fi
}

function gbw_command_symlink_pcm_delete {
    echo "gbw_command_symlink_pcm_delete"
}

function gbw_command_symlink_pcm_create {
    echo "gbw_command_symlink_pcm_create"
}