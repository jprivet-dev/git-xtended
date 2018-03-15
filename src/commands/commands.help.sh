#!/usr/bin/env bash

function gbw_command_help {
    echo "$GBW_PARAMS_LABEL_GBW_COMMANDS :"
    gbw_command_help_command_line "help" ............ "Display help information about $GBW_PARAMS_TITLE_SHORT"
    gbw_command_help_command_line "install" ......... "Select and install $GBW_PARAMS_TITLE_SHORT elements"
    gbw_command_help_command_line "reload" .......... "Reload $GBW_PARAMS_TITLE_SHORT"
    gbw_command_help_command_line "status" .......... "Show status of $GBW_PARAMS_TITLE_SHORT elements"
    gbw_command_help_command_line "test [<func>]" ... "Run one or all $GBW_PARAMS_TITLE_SHORT tests"
    echo
}

function gbw_command_help_command_line {
    echo -e "${GBW_PARAMS_TAB}gbw ${C_LIGHT_YELLOW}$1${F_RESET} $2 $3"
}