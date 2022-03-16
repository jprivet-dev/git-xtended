#!/usr/bin/env bash

function gx_install_commands_completion() {
  complete -W \
    "${GX_PARAMS_COMMANDS_COMPLETION}" \
    "${GX_PARAMS_COMMANDS_GX}"
}
