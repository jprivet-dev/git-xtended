#!/usr/bin/env bash

# Make file executable
# $ chmod +x ~/git-bash-workflow/bash/bash_profile.sh

# Execute file
# $ ~/git-bash-workflow/bash/bash_profile.sh

# Reload bash_profile
# source ~/.bash_profile'

echo " Git Bash Workflow"
echo " - Prompt with Git information"
echo " - Git aliases & hooks"
echo " - Agile Git workflow commands"
echo " @info https://github.com/jprivet-dev/git-bash-workflow.git"

source ~/git-bash-workflow/includes/gbw.params.sh

if [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/includes/gbw.utils.sh
source ~/git-bash-workflow/includes/gbw.formatting.sh
source ~/git-bash-workflow/includes/gbw.git.sh
source ~/git-bash-workflow/includes/gbw.prompt.sh

gbw_prompt_init