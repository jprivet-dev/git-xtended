#!/usr/bin/env bash

###################
# START TEST MODE #
###################

GBW_ENV_TEST=1

echo -e "${C_LIGHT_YELLOW}"
echo -e "#############################"
echo -e "# ${GBW_PARAMS_TITLE} TESTING #"
echo -e "#############################"
echo -e "${F_RESET}"

alias git="gbw_test_fake_git"

source ~/git-bash-workflow/src/test.sh
source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/tests/test.tests.sh

source ~/git-bash-workflow/tests/prompt.tests.sh
source ~/git-bash-workflow/tests/git.tests.sh
source ~/git-bash-workflow/tests/utils.tests.sh

gbw_test_run $1

unalias git
unset GBW_ENV_TEST

####################
# FINISH TEST MODE #
####################

echo
echo -e "${C_LIGHT_YELLOW}# Reload original ${GBW_PARAMS_TITLE} !${F_RESET}";
echo

source ~/git-bash-workflow/gbw.sh
