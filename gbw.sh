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

source ~/git-bash-workflow/src/gbw.variables.sh
source ~/git-bash-workflow/config/params.sh

if [[ "$GBW_TEST_MODE" == 1 ]]; then
    source ~/git-bash-workflow/config/params_test.sh
elif [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/gbw.utils.sh
source ~/git-bash-workflow/src/gbw.commands.sh
source ~/git-bash-workflow/src/gbw.colors.sh
source ~/git-bash-workflow/src/gbw.git.sh
source ~/git-bash-workflow/src/gbw.prompt.sh

source ~/git-bash-workflow/bash/.bash_aliases

gbw_prompt_init
