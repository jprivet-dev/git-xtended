#!/usr/bin/env bash

echo "#############################"
echo "# Git Bash Workflow TESTING #"
echo "#############################"
echo

alias git="gbw_tests_fake_git"

source ~/git-bash-workflow/gbw.sh
source ~/git-bash-workflow/src/gbw.tests.sh

source ~/git-bash-workflow/tests/gbw.prompt.tests.sh
source ~/git-bash-workflow/tests/gbw.git.tests.sh

gbw_tests_run_all

unalias git

echo
echo -e "${C_LIGHT_YELLOW}[ Reload original Git Bash Workflow ! ]${F_RESET}";

source ~/git-bash-workflow/gbw.sh
