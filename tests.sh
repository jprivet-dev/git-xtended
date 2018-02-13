#!/usr/bin/env bash

echo "#############################"
echo "# Git Bash Workflow TESTING #"
echo "#############################"
echo

source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/src/gbw.tests.sh
source ~/git-bash-workflow/tests/gbw.prompt.tests.sh

gbw_tests_run_all