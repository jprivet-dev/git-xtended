#!/usr/bin/env bash

function gx_commands_help() {
  gx_print_colors "${C_WHITE}  # ${GX_PARAMS_GX_COMMANDS_TITLE}${F_RESET} :"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_HELP}" "" ................ "Display all help information about ${GX_PARAMS_GX_TITLE_SHORT}"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_PROMPT}" "" .............. "Display prompt information"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_GALIASES}" "" ............ "Display all Git aliases"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_BALIASES}" "" ............ "Display all Bash aliases"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_COMMANDS}" "" ............ "Display all ${GX_PARAMS_GX_TITLE_SHORT} commands"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_INSTALL}" "" ............. "Select and install ${GX_PARAMS_GX_TITLE_SHORT} elements"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_RELOAD}" "" .............. "Reload ${GX_PARAMS_GX_TITLE_SHORT}"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_STATUS}" "" .............. "Show status of ${GX_PARAMS_GX_TITLE_SHORT} elements"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_CONFIG}" "" .............. "Show ${GX_PARAMS_GX_TITLE_SHORT} git configuration"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_REMOTE_REF_BRANCH}" "" ... "Show remote reference branch (local & global)"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_COLORS}" "" .............. "Show all ${GX_PARAMS_GX_TITLE_SHORT} colors"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_TEST}" "[<func>]" ....... "Run one or all ${GX_PARAMS_GX_TITLE_SHORT} tests"
  gx_commands_help_command_line "${GX_PARAMS_COMMANDS_ACTION_VERSION}" "" ............. "Show ${GX_PARAMS_GX_TITLE_SHORT} version"
  gx_print
}

function gx_commands_help_command_line() {
  local option
  [ "$2" == "" ] && option=" " || option=" $2 "
  gx_print_colors "${GX_PARAMS_TAB}gx ${C_LIGHT_YELLOW}$1${F_RESET}${option}${C_DARK_GRAY}$3${F_RESET} $4"
}
