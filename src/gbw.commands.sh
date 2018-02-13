#!/usr/bin/env bash

# Alias of gbw_command_parse_action
function gbw {
    gbw_command_parse_action $@
}

function gbw_command_parse_action {
    local action=$1
    shift

    case $action in
        aliases)
            gbw_command_aliases $@
        ;;
        *)
            echo "Unknow action '$action'"
            return
        ;;
    esac
}

function gbw_command_parse_options {
    echo "options"
}

function gbw_command_aliases {
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