#!/usr/bin/env bash

function gx_command_help {
    gx_print_colors "${C_WHITE}${GBW_PARAMS_LABEL_GBW_COMMANDS}${F_RESET} :"
    gx_command_help_command_line "help" "" ............ "Display help information about ${GBW_PARAMS_TITLE_SHORT}"
    gx_command_help_command_line "install" "" ......... "Select and install ${GBW_PARAMS_TITLE_SHORT} elements"
    gx_command_help_command_line "reload" "" .......... "Reload ${GBW_PARAMS_TITLE_SHORT}"
    gx_command_help_command_line "status" "" .......... "Show status of ${GBW_PARAMS_TITLE_SHORT} elements"
    gx_command_help_command_line "config" "" .......... "Show ${GBW_PARAMS_TITLE_SHORT} git configuration"
    gx_command_help_command_line "colors" "" .......... "Show all ${GBW_PARAMS_TITLE_SHORT} colors"
    gx_command_help_command_line "test"  "[<func>]" ... "Run one or all ${GBW_PARAMS_TITLE_SHORT} tests"
    gx_print
}

function gx_command_help_command_line {
    local option
    [ "$2" == "" ] && option=" " || option=" $2 "
    gx_print_colors "${GBW_PARAMS_TAB}gx ${C_LIGHT_YELLOW}$1${F_RESET}${option}${C_DARK_GRAY}$3${F_RESET} $4"
}