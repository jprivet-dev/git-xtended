#!/usr/bin/env bash

GX_ENV_TEST=${GX_ENV_TEST:-0}

source ~/git-xtended/params/default/params.sh

if [ "${GX_ENV_TEST}" == 1 ]; then
  source ~/git-xtended/params/test/params.test.sh
elif [[ -f ~/git-xtended/params.sh ]]; then
  source ~/git-xtended/params.sh
fi

source ~/git-xtended/src/colors/colors.sh
source ~/git-xtended/src/commands/commands.sh
source ~/git-xtended/src/git/git.sh
source ~/git-xtended/src/install/install.sh
source ~/git-xtended/src/logo/logo.sh
source ~/git-xtended/src/prompt/prompt.sh
source ~/git-xtended/src/utils/utils.sh

gx_install
