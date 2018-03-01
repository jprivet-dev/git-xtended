#!/usr/bin/env bash

###################
# START TEST MODE #
###################

GBW_ENV_TEST=1

echo "#############################"
echo "# Git Bash Workflow TESTING #"
echo "#############################"
echo

alias git="gbw_test_fake_git"

source ~/git-bash-workflow/src/test.sh
source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/tests/prompt.tests.sh
source ~/git-bash-workflow/tests/git.tests.sh
source ~/git-bash-workflow/tests/utils.tests.sh

gbw_test_run_all

unalias git
unset GBW_ENV_TEST

####################
# FINISH TEST MODE #
####################

echo
echo -e "${C_LIGHT_YELLOW}[ Reload original Git Bash Workflow ! ]${F_RESET}";

source ~/git-bash-workflow/gbw.sh
