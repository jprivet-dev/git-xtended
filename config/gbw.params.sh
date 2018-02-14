#!/usr/bin/env bash

# Change local
if [ -z ${LC_ALL+x} ]; then
    echo "# LC_ALL is unset > export LC_ALL=C"
    export LC_ALL=C
else
    echo "# LC_ALL is set to '$var'"
fi

GBW_GIT_REMOTE_BRANCH_REF=""
GBW_TESTS_ASSERT_OK_SHOW_MESSAGE=0