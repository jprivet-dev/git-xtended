#!/usr/bin/env bash

###################
# START TEST MODE #
###################

GBW_TEST_MODE=1

echo "#############################"
echo "# Git Bash Workflow TESTING #"
echo "#############################"
echo

alias git="gbw_test_fake_git"
source ~/git-bash-workflow/src/gbw.test.sh

source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/tests/gbw.prompt.tests.sh
source ~/git-bash-workflow/tests/gbw.git.tests.sh
source ~/git-bash-workflow/tests/gbw.utils.tests.sh

gbw_test_run_all

unalias git
unset GBW_TEST_MODE

####################
# FINISH TEST MODE #
####################

echo
echo -e "${C_LIGHT_YELLOW}[ Reload original Git Bash Workflow ! ]${F_RESET}";

source ~/git-bash-workflow/gbw.sh
