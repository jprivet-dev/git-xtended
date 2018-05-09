#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

source ~/git-bash-workflow/params/default/params.sh

if [[ "${GBW_ENV_TEST}" == 1 ]]; then
    source ~/git-bash-workflow/params/test/params.test.sh
elif [[ -f ~/git-bash-workflow/params/default/params.sh ]]; then
    source ~/git-bash-workflow/params/default/params.sh
fi

source ~/git-bash-workflow/src/utils/utils.sh
source ~/git-bash-workflow/src/commands/commands.sh
source ~/git-bash-workflow/src/colors/colors.sh
source ~/git-bash-workflow/src/git/git.sh
source ~/git-bash-workflow/src/prompt/prompt.sh
source ~/git-bash-workflow/src/bash/bash.sh
source ~/git-bash-workflow/src/install/install.sh

gbw_install_activation
gbw_install_activation_show_status
