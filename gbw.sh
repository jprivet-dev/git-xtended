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
echo

source ~/git-bash-workflow/src/gbw.variables.sh

source ~/git-bash-workflow/config/gbw.params.sh
if [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/src/gbw.utils.sh
source ~/git-bash-workflow/src/gbw.commands.sh
source ~/git-bash-workflow/src/gbw.formatting.sh
source ~/git-bash-workflow/src/gbw.git.sh
source ~/git-bash-workflow/src/gbw.prompt.sh

source ~/git-bash-workflow/src/gbw.bash_aliases.sh

gbw_prompt_init