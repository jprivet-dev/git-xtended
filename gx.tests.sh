#!/usr/bin/env bash

###################
# START TEST MODE #
###################

gx_print_title_1 ${GX_PARAMS_TITLE} TESTING

gx_print_question_yes_no "Would you like to run the tests"

if [ "${_GX_PRINT_QUESTION_YES_NO_LAST_VALUE}" != "${GX_PARAMS_YES}" ]; then
    gx_print_step "Abort tests"
    return
fi

# shellcheck disable=SC2034
GX_ENV_TEST=1

alias git="gx_test_fake_git"

source ~/git-xtended/src/test/test.sh
source ~/git-xtended/gx.sh

source ~/git-xtended/tests/test.tests.sh

source ~/git-xtended/tests/commands.tests.sh
source ~/git-xtended/tests/colors.tests.sh
source ~/git-xtended/tests/prompt.tests.sh
source ~/git-xtended/tests/git.tests.sh
source ~/git-xtended/tests/utils.tests.sh

gx_test_run $1

unalias git
unset GX_ENV_TEST

#
# FINISH TEST MODE
#

gx_print_step "Reload original ${GX_PARAMS_TITLE} !"

source ~/git-xtended/gx.sh
