#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

source ~/git-bash-workflow/config/params.sh

echo
echo -e "+------------------------------------------------------------+"
echo -e "| Git Bash Workflow                                    $GBW_PARAMS_VERSION |"
echo -e "+-----------------------------------------------+------------+"

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

####################################
#              PROMPT              #
####################################

gbw_prompt_init_state="$GBW_PARAMS_OFF_C"

if [ "$GBW_PARAMS_PROMPT_INIT_ACTIVE" == 1 ]; then
    gbw_prompt_init
    gbw_prompt_init_state="$GBW_PARAMS_ON_C"
fi

echo -e "| Prompt with Git information                   | $gbw_prompt_init_state        |"

####################################
#           GIT ALIASES            #
####################################

if [ "$GBW_PARAMS_GIT_ALIASES_INIT_ACTIVE" == 1 ]; then
    gbw_git_aliases_enable
    gbw_git_aliases_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_aliases_disable
    gbw_git_aliases_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git aliases                                   | $gbw_git_aliases_init_state        |"

####################################
#            GIT HOOKS             #
####################################

if [ "$GBW_PARAMS_GIT_HOOKS_INIT_ACTIVE" == 1 ]; then
    gbw_git_config_hooks_enable
    gbw_git_hooks_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_config_hooks_disable
    gbw_git_hooks_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git hooks                                     | $gbw_git_hooks_init_state        |"

echo -e "| Agile Git workflow commands                   | (wip)      |"

echo -e "+-----------------------------------------------+------------+"
echo -e "| @info https://github.com/jprivet-dev/git-bash-workflow.git |"
echo -e "+------------------------------------------------------------+"
echo
