#!/usr/bin/env bash
# shellcheck disable=SC2034
:

GX_PARAMS_COMMANDS_GX="gx"

GX_PARAMS_COMMANDS_ACTION_GALIASES="galiases"
GX_PARAMS_COMMANDS_ACTION_BALIASES="baliases"
GX_PARAMS_COMMANDS_ACTION_COLORS="colors"
GX_PARAMS_COMMANDS_ACTION_COMMANDS="commands"
GX_PARAMS_COMMANDS_ACTION_CONFIG="config"
GX_PARAMS_COMMANDS_ACTION_HELP="help"
GX_PARAMS_COMMANDS_ACTION_INSTALL="install"
GX_PARAMS_COMMANDS_ACTION_PROMPT="prompt"
GX_PARAMS_COMMANDS_ACTION_RELOAD="reload"
GX_PARAMS_COMMANDS_ACTION_REMOTE_REF_BRANCH="remote-ref-branch"
GX_PARAMS_COMMANDS_ACTION_STATUS="status"
GX_PARAMS_COMMANDS_ACTION_TEST="test"
GX_PARAMS_COMMANDS_ACTION_VERSION="version"

GX_PARAMS_COMMANDS_COMPLETION=" \
  ${GX_PARAMS_COMMANDS_ACTION_GALIASES}
  ${GX_PARAMS_COMMANDS_ACTION_BALIASES}
  ${GX_PARAMS_COMMANDS_ACTION_COLORS}
  ${GX_PARAMS_COMMANDS_ACTION_COMMANDS}
  ${GX_PARAMS_COMMANDS_ACTION_CONFIG}
  ${GX_PARAMS_COMMANDS_ACTION_HELP}
  ${GX_PARAMS_COMMANDS_ACTION_INSTALL}
  ${GX_PARAMS_COMMANDS_ACTION_PROMPT}
  ${GX_PARAMS_COMMANDS_ACTION_RELOAD}
  ${GX_PARAMS_COMMANDS_ACTION_REMOTE_REF_BRANCH}
  ${GX_PARAMS_COMMANDS_ACTION_STATUS}
  ${GX_PARAMS_COMMANDS_ACTION_TEST}
  ${GX_PARAMS_COMMANDS_ACTION_VERSION}
"
