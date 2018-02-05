#!/usr/bin/env bash

function git_get_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_get_changes_nb {
    git status --porcelain 2> /dev/null | wc -l
}

function git_diff_current_branch_origin_dev {
    git diff --stat origin/dev 2> /dev/null
}