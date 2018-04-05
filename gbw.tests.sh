#!/usr/bin/env bash

###################
# START TEST MODE #
###################

GBW_ENV_TEST=1


alias git="gbw_test_fake_git"

source ~/git-bash-workflow/src/test/test.sh
source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/tests/test.tests.sh

source ~/git-bash-workflow/tests/bash.tests.sh
source ~/git-bash-workflow/tests/commands.tests.sh
source ~/git-bash-workflow/tests/colors.tests.sh
source ~/git-bash-workflow/tests/prompt.tests.sh
source ~/git-bash-workflow/tests/git.tests.sh
source ~/git-bash-workflow/tests/utils.tests.sh

gbw_print_title_1 ${GBW_PARAMS_TITLE} TESTING
gbw_test_run $1

unalias git
unset GBW_ENV_TEST

#
# FINISH TEST MODE
#

gbw_print_step "Reload original ${GBW_PARAMS_TITLE} !"

source ~/git-bash-workflow/gbw.sh
