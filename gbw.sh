#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

source ~/git-bash-workflow/config/params.sh

if [[ "$GBW_ENV_TEST" == 1 ]]; then
    source ~/git-bash-workflow/config/params.test.sh
elif [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/utils.sh
source ~/git-bash-workflow/src/commands.sh
source ~/git-bash-workflow/src/colors.sh
source ~/git-bash-workflow/src/git.sh
source ~/git-bash-workflow/src/prompt.sh
source ~/git-bash-workflow/src/bash.sh

echo
echo -e "+------------------------------------------------------------+"
echo -e "| Git Bash Workflow                                    $GBW_PARAMS_VERSION |"
echo -e "+------------------------------------------------------------+"

source ~/git-bash-workflow/src/install.sh

echo -e "+------------------------------------------------------------+"
echo -e "| @info https://github.com/jprivet-dev/git-bash-workflow.git |"
echo -e "+------------------------------------------------------------+"
echo
