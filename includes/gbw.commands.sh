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
            echo "Unknow $action"
        ;;
    esac
}

function gbw_command_parse_options {
    echo "options"
}

function gbw_command_aliases {
    gbw_git_apply_global_config $@
}