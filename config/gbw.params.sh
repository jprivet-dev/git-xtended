#!/usr/bin/env bash

# Change local
if [ -z ${LC_ALL+x} ]; then
    echo "# LC_ALL is unset > export LC_ALL=C"
    export LC_ALL=C
else
    echo "# LC_ALL is set to '$var'"
fi

GBW_BRANCH_MAIN_REMOTE_DEVELOP="origin/develop"
GBW_BRANCH_MAIN_REMOTE_RELEASE="origin/release"
GBW_BRANCH_MAIN_REMOTE_MASTER="origin/"

GBW_TESTS_ASSERT_OK_SHOW_MESSAGE=0