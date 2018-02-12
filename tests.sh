#!/usr/bin/env bash

echo "Git Bash Workflow Testing"
echo

source ~/git-bash-workflow/includes/gbw.variables.sh
source ~/git-bash-workflow/includes/gbw.tests.sh

source ~/git-bash-workflow/tests/gbw.prompt.tests.sh

gbw_tests_run_all