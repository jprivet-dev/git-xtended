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

echo "##########################################"
echo "# Switch to original Git Bash Workflow ! #";
echo "##########################################"
echo


source ~/git-bash-workflow/gbw.sh
