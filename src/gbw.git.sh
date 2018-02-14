#!/usr/bin/env bash

function gbw_git_config_set_aliases {
    local global="$1"
    [[ "$global" != "--global" ]] && global=""

    # git branch
    git config $global alias.b branch

    # git diff
    git config $global alias.d "diff --function-context"

    # git add
    git config $global alias.a "add"
    git config $global alias.all "add ."

    # git commit
    git config $global alias.c "commit -m"
    git config $global alias.amend "commit -m --amend"
    git config $global alias.undo "reset --soft HEAD^"

    # git checkout
    git config $global alias.k checkout

    # git log
    local _HASH="%C(yellow)%h"
    local _TIME="%C(cyan)[%ar]"
    local _AUTHOR="%C(green)<%<(9,trunc)%aN>"
    local _REF="%C(auto)%d"
    local _SUBJECT="%C(reset)%s"

    local _ONELINE="log --graph --oneline --decorate --date=short --pretty=format:'$_HASH $_TIME $_AUTHOR$_REF $_SUBJECT'"

    git config $global alias.l "$_ONELINE -12"
    git config $global alias.ll "$_ONELINE"
    git config $global alias.lcount "shortlog -sn"

    # git reset
    git config $global alias.r "reset"
    git config $global alias.rrr "!sh -c 'git clean -f -d; git reset --hard HEAD'"
    git config $global alias.untracked "clean -f -d"

    # git status
    git config $global alias.s "status -s"
    git config $global alias.ss status

    # git grep
    git config $global alias.sniffer "grep --break --heading --line-number --extended-regexp 'dump\(|console\.[^(]+\('"
}

function gbw_git_config_unset_aliases {
    [[ "$1" == "--global" ]] && global="" || global="--global"

    git config $global --unset alias.b
	git config $global --unset alias.d
	git config $global --unset alias.a
	git config $global --unset alias.all
	git config $global --unset alias.c
	git config $global --unset alias.amend
	git config $global --unset alias.undo
	git config $global --unset alias.k
	git config $global --unset alias.l
	git config $global --unset alias.ll
	git config $global --unset alias.lcount
	git config $global --unset alias.untracked
	git config $global --unset alias.r
	git config $global --unset alias.rrr
	git config $global --unset alias.s
	git config $global --unset alias.ss
	git config $global --unset alias.sniffer
}

function gbw_git_get_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function gbw_git_status {
    git status --porcelain 2> /dev/null
}

function gbw_git_get_changes_nb {
    gbw_git_status | wc -l
}

function gbw_git_diff_current_branch_origin_dev {
    git diff --stat origin/dev 2> /dev/null
}

function gbw_git_get_status_changes_to_be_committed_count {
    gbw_git_status | grep '^[^? ]' | wc -l
}

function gbw_git_get_status_changes_to_be_committed_modified_count {
    gbw_git_status | grep '^M' | wc -l
}

function gbw_git_get_status_changes_to_be_committed_modified_extended_count {
    # ' ' = unmodified
    # M = modified / A = added / D = deleted
    # R = renamed / C = copied / U = updated but unmerged
    # ? = untracked / ! = ignored
    # get all without D, A, ? & ' '
    gbw_git_status | grep '^[^DA? ]' | wc -l
}

function gbw_git_get_status_changes_to_be_committed_deleted_count {
    gbw_git_status | grep '^D' | wc -l
}

function gbw_git_get_status_changes_to_be_committed_new_file_count {
    gbw_git_status | grep '^A' | wc -l
}

function gbw_git_get_status_changes_not_staged_for_commit_count {
    gbw_git_status | grep '^.[^? ]' | wc -l
}

function gbw_git_get_status_untracked_files_count {
    gbw_git_status | grep '^??' | wc -l
}

function gbw_git_status_ahead {
    local from_branch=$1
    local to_branch=$2
    git rev-list --left-right --count $from_branch...$to_branch 2> /dev/null
}

function gbw_git_status_ahead_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gbw_git_status_ahead_count called
    # into testing function "test_gbw_git_status_ahead_count". Find why !!!
    gbw_git_status_ahead "$from_branch" "$to_branch" 2> /dev/null | while read -a array; do echo ${array[0]} ; done
}

function gbw_git_status_behind {
    local from_branch=$1
    local to_branch=$2

    git rev-list --left-right --count $to_branch...$from_branch 2> /dev/null
}

function gbw_git_status_behind_count {
    local from_branch=$1
    local to_branch=$2
    # TODO : use "| while read -a array; do echo ${array[0]} ; done"
    # instead of "| cut -f 1". Last tip does not work when gbw_git_status_ahead_count called
    # into testing function "test_gbw_git_status_behind_count". Find why !!!
    gbw_git_status_behind "$from_branch" "$to_branch" | while read -a array; do echo ${array[0]} ; done
}