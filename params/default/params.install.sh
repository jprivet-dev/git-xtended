#!/usr/bin/env bash
# shellcheck disable=SC2034
:

GX_PARAMS_INSTALL_PROMPT_STATUS="${GX_PARAMS_ENABLED}"
GX_PARAMS_INSTALL_GIT_ALIASES_STATUS="${GX_PARAMS_ENABLED}"

if [ -z ${GX_PARAMS_INSTALL_OLD_READY+x} ]; then
    GX_PARAMS_INSTALL_OLD_PS1=${PS1}
    GX_PARAMS_INSTALL_OLD_PS2=${PS2}
    GX_PARAMS_INSTALL_OLD_PROMPT_COMMAND=${PROMPT_COMMAND}
    GX_PARAMS_INSTALL_OLD_READY="true"
fi

#GX_PARAMS_INSTALL_GIT_HOOKS_STATUS="${GX_PARAMS_ENABLED}"
#GX_PARAMS_INSTALL_WORKFLOW_STATUS="${GX_PARAMS_ENABLED}"
#GX_PARAMS_INSTALL_BASH_ALIASES_STATUS="${GX_PARAMS_ENABLED}"
