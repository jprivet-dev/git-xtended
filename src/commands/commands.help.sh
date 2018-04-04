#!/usr/bin/env bash

function gbw_command_help {
    gbw_print_colors "${C_WHITE}${GBW_PARAMS_LABEL_GBW_COMMANDS}${F_RESET} :"
    gbw_command_help_command_line "help" "" ............ "Display help information about ${GBW_PARAMS_TITLE_SHORT}"
    gbw_command_help_command_line "install" "" ......... "Select and install ${GBW_PARAMS_TITLE_SHORT} elements"
    gbw_command_help_command_line "reload" "" .......... "Reload ${GBW_PARAMS_TITLE_SHORT}"
    gbw_command_help_command_line "status" "" .......... "Show status of ${GBW_PARAMS_TITLE_SHORT} elements"
    gbw_command_help_command_line "colors" "" .......... "Show all ${GBW_PARAMS_TITLE_SHORT} colors"
    gbw_command_help_command_line "test"  "[<func>]" ... "Run one or all ${GBW_PARAMS_TITLE_SHORT} tests"
    gbw_print
}

function gbw_command_help_command_line {
    local option
    [ "$2" == "" ] && option=" " || option=" $2 "
    gbw_print_colors "${GBW_PARAMS_TAB}gbw ${C_LIGHT_YELLOW}$1${F_RESET}${option}${C_DARK_GRAY}$3${F_RESET} $4"
}