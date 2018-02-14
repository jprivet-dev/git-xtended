#!/usr/bin/env bash

# Make file executable
# $ chmod +x ~/git-bash-workflow/bash/bash_profile.sh

# Execute file
# $ ~/git-bash-workflow/bash/bash_profile.sh

# Reload bash_profile
# source ~/.bash_profile'


GBW_TESTS_MODE=${GBW_TESTS_MODE:-0}

echo "----------------------------------------------------------"
echo "Git Bash Workflow"
echo "- Prompt with Git information"
echo "- Git aliases & hooks"
echo "- Agile Git workflow commands"
echo "@info https://github.com/jprivet-dev/git-bash-workflow.git"
echo "----------------------------------------------------------"
echo

source ~/git-bash-workflow/src/gbw.variables.sh
source ~/git-bash-workflow/config/gbw.params.sh

if [[ "$GBW_TESTS_MODE" == 1 ]]; then
    source ~/git-bash-workflow/config/gbw.params-tests.sh
elif [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/gbw.utils.sh
source ~/git-bash-workflow/src/gbw.commands.sh
source ~/git-bash-workflow/src/gbw.colors.sh
source ~/git-bash-workflow/src/gbw.git.sh
source ~/git-bash-workflow/src/gbw.prompt.sh

source ~/git-bash-workflow/bash/gbw.bash_aliases.sh

gbw_prompt_init
