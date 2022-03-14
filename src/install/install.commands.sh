#!/usr/bin/env bash

function gx_install_commands_completion() {
  complete -W \
    " \
      ${GX_PARAMS_COMMANDS_ACTION_ALIAS}
      ${GX_PARAMS_COMMANDS_ACTION_COLORS}
      ${GX_PARAMS_COMMANDS_ACTION_CONFIG}
      ${GX_PARAMS_COMMANDS_ACTION_COMMANDS}
      ${GX_PARAMS_COMMANDS_ACTION_HELP}
      ${GX_PARAMS_COMMANDS_ACTION_INSTALL}
      ${GX_PARAMS_COMMANDS_ACTION_PROMPT}
      ${GX_PARAMS_COMMANDS_ACTION_RELOAD}
      ${GX_PARAMS_COMMANDS_ACTION_STATUS}
      ${GX_PARAMS_COMMANDS_ACTION_TEST}
    " \
    "${GX_PARAMS_COMMANDS_GX}"
}
