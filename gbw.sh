#!/usr/bin/env bash

GBW_ENV_TEST=${GBW_ENV_TEST:-0}

echo "----------------------------------------------------------"
echo "Git Bash Workflow"

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

gbw_prompt_init_state="$GBW_OFF_C"

if [ "$GBW_PROMPT_INIT_ACTIVE" == 1 ]; then
    gbw_prompt_init
    gbw_prompt_init_state="$GBW_ON_C"
fi

echo -e "- Prompt with Git information : $gbw_prompt_init_state"

echo "- Git aliases & hooks"
echo "- Agile Git workflow commands"

echo
echo "@info https://github.com/jprivet-dev/git-bash-workflow.git"
echo "----------------------------------------------------------"
echo
