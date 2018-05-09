#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

source ~/git-xtended/params/default/params.sh

if [[ "${GBW_ENV_TEST}" == 1 ]]; then
    source ~/git-xtended/params/test/params.test.sh
elif [[ -f ~/git-xtended/params/default/params.sh ]]; then
    source ~/git-xtended/params/default/params.sh
fi

source ~/git-xtended/src/utils/utils.sh
source ~/git-xtended/src/commands/commands.sh
source ~/git-xtended/src/colors/colors.sh
source ~/git-xtended/src/git/git.sh
source ~/git-xtended/src/prompt/prompt.sh
source ~/git-xtended/src/bash/bash.sh
source ~/git-xtended/src/install/install.sh

gx_install_activation
gx_install_activation_show_status
