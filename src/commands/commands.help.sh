#!/usr/bin/env bash

function gx_command_help() {
    gx_print_colors "${C_WHITE}  # ${GX_PARAMS_LABEL_GX_COMMANDS}${F_RESET} :"
    gx_command_help_command_line "help" "" ............ "Display help information about ${GX_PARAMS_TITLE_SHORT}"
    gx_command_help_command_line "install" "" ......... "Select and install ${GX_PARAMS_TITLE_SHORT} elements"
    gx_command_help_command_line "reload" "" .......... "Reload ${GX_PARAMS_TITLE_SHORT}"
    gx_command_help_command_line "status" "" .......... "Show status of ${GX_PARAMS_TITLE_SHORT} elements"
    gx_command_help_command_line "config" "" .......... "Show ${GX_PARAMS_TITLE_SHORT} git configuration"
    gx_command_help_command_line "colors" "" .......... "Show all ${GX_PARAMS_TITLE_SHORT} colors"
    gx_command_help_command_line "test" "[<func>]" ... "Run one or all ${GX_PARAMS_TITLE_SHORT} tests"
    gx_print
}

function gx_command_help_command_line() {
    local option
    [ "$2" == "" ] && option=" " || option=" $2 "
    gx_print_colors "${GX_PARAMS_TAB}gx ${C_LIGHT_YELLOW}$1${F_RESET}${option}${C_DARK_GRAY}$3${F_RESET} $4"
}
