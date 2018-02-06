#!/usr/bin/env bash

function git_apply_global_config {
    # git branch
    git config --global alias.b branch

    # git commit
    git config --global alias.c "commit -m"
    git config --global alias.amend "commit -m --amend"
    git config --global alias.undo "reset --soft HEAD^"

    # git checkout
    git config --global alias.co checkout

    # git log
    local _HASH="%C(yellow)%h"
    local _TIME="%C(cyan)[%ar]"
    local _AUTHOR="%C(green)<%<(9,trunc)%aN>"
    local _REF="%C(auto)%d"
    local _SUBJECT="%C(reset)%s"

    local _ONELINE="log --graph --oneline --decorate --date=short --pretty=format:'$_HASH $_TIME $_AUTHOR$_REF $_SUBJECT'"

    git config --global alias.l "$_ONELINE -12"
    git config --global alias.ll "$_ONELINE"
    git config --global alias.lcount "shortlog -sn"

    # git reset
    git config --global alias.untracked "clean -f -d"
    git config --global alias.rrr "!sh -c 'git clean -f -d; git reset --hard HEAD'"

    # git status
    git config --global alias.s "status -s"
    git config --global alias.ss status
}

function git_get_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_get_changes_nb {
    git status --porcelain 2> /dev/null | wc -l
}

function git_diff_current_branch_origin_dev {
    git diff --stat origin/dev 2> /dev/null
}

function git_get_status_changes_to_be_committed_count {
    git status --porcelain 2> /dev/null | grep '^[^? ]' | wc -l
}

function git_get_status_changes_not_staged_for_commit_count {
    git status --porcelain 2> /dev/null | grep '^.M' | wc -l
}

function git_get_status_untracked_files_count {
    git status --porcelain 2> /dev/null | grep '^??' | wc -l
}

