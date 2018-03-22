#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}
echo "==> GBW: GBW_ENV_TEST = ${GBW_ENV_TEST} "

source ~/git-bash-workflow/params/default/params.sh

if [[ "${GBW_ENV_TEST}" == 1 ]]; then
    source ~/git-bash-workflow/params/test/params.test.sh
elif [[ -f ~/git-bash-workflow/params/default/params.sh ]]; then
    source ~/git-bash-workflow/params/default/params.sh
fi

source ~/git-bash-workflow/src/utils.sh
source ~/git-bash-workflow/src/commands.sh
source ~/git-bash-workflow/src/colors.sh
source ~/git-bash-workflow/src/git.sh
source ~/git-bash-workflow/src/prompt.sh
source ~/git-bash-workflow/src/bash.sh
source ~/git-bash-workflow/src/install.sh

gbw_install_activation
gbw_install_activation_show_status
