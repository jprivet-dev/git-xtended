#!/usr/bin/env bash

GBW_TEST_MODE=${GBW_TEST_MODE:-0}

echo "----------------------------------------------------------"
echo "Git Bash Workflow"
echo "- Prompt with Git information"
echo "- Git aliases & hooks"
echo "- Agile Git workflow commands"
echo "@info https://github.com/jprivet-dev/git-bash-workflow.git"
echo "----------------------------------------------------------"
echo

source ~/git-bash-workflow/src/variables.sh
source ~/git-bash-workflow/config/params.sh

if [[ "$GBW_TEST_MODE" == 1 ]]; then
    source ~/git-bash-workflow/config/params_test.sh
elif [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/utils.sh
source ~/git-bash-workflow/src/commands.sh
source ~/git-bash-workflow/src/colors.sh
source ~/git-bash-workflow/src/git.sh
source ~/git-bash-workflow/src/prompt.sh

source ~/git-bash-workflow/bash/.bash_aliases

gbw_prompt_init
