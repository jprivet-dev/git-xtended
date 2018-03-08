#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

echo "----------------------------------------------------------"
echo "Git Bash Workflow"
echo
echo "Initialization..."
source ~/git-bash-workflow/src/variables.sh
source ~/git-bash-workflow/config/params.sh

if [[ "$GBW_ENV_TEST" == 1 ]]; then
    source ~/git-bash-workflow/config/params_test.sh
elif [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/utils.sh
source ~/git-bash-workflow/src/commands.sh
source ~/git-bash-workflow/src/colors.sh
source ~/git-bash-workflow/src/git.sh
source ~/git-bash-workflow/src/prompt.sh
source ~/git-bash-workflow/src/bash.aliases.sh

####################################
#              PROMPT              #
####################################

gbw_prompt_init_state="$GBW_OFF_C"

if [ "$GBW_PROMPT_INIT_ACTIVE" == 1 ]; then
    gbw_prompt_init
    gbw_prompt_init_state="$GBW_ON_C"
fi

echo -e "- Prompt with Git information : $gbw_prompt_init_state"

####################################
#           GIT ALIASES            #
####################################

if [ "$GBW_GIT_ALIASES_INIT_ACTIVE" == 1 ]; then
    gbw_git_aliases_enable
    gbw_git_aliases_init_state="$GBW_ON_C"
else
    gbw_git_aliases_disable
    gbw_git_aliases_init_state="$GBW_OFF_C"
fi

echo -e "- Git aliases : $gbw_git_aliases_init_state"

####################################
#            GIT HOOKS             #
####################################

if [ "$GBW_GIT_HOOKS_INIT_ACTIVE" == 1 ]; then
    gbw_git_config_hooks_enable
    gbw_git_hooks_init_state="$GBW_ON_C"
else
    gbw_git_config_hooks_disable
    gbw_git_hooks_init_state="$GBW_OFF_C"
fi

echo -e "- Git hooks : $gbw_git_hooks_init_state"


echo "- Agile Git workflow commands : not available (wip)"

echo
echo "@info https://github.com/jprivet-dev/git-bash-workflow.git"
echo "----------------------------------------------------------"
echo
