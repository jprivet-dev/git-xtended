#!/usr/bin/env bash

# Make file executable
# $ chmod +x ~/git-bash-workflow/bash/bash_profile.sh

# Execute file
# $ ~/git-bash-workflow/bash/bash_profile.sh

# Reload bash_profile
# source ~/.bash_profile'

echo "# Bash profile extension"

source ~/git-bash-workflow/bash/includes/bash.params.sh

if [[ -f ~/git-bash-workflow/params.sh ]]; then
    source ~/git-bash-workflow/params.sh
fi

source ~/git-bash-workflow/bash/includes/bash.variables.sh
source ~/git-bash-workflow/bash/includes/bash.formatting.sh
source ~/git-bash-workflow/bash/includes/bash.functions.sh

source ~/git-bash-workflow/bash/includes/bash.git.sh
source ~/git-bash-workflow/bash/includes/bash.prompt.sh