#!/usr/bin/env bash

function gbw_git_config_set_aliases {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    # git branch
    git config $global alias.b branch

    # git diff
    git config $global alias.d '!f() { '${GBW_PARAMS_GIT_ALIAS_DIFF_FILE}' "$1"; }; f'

    # git add
    git config $global alias.a "add"
    git config $global alias.all "add --all"
    git config $global alias.nm "add ."
    git config $global alias.md "add --update"

    # git commit
    git config $global alias.c '!f() { '${GBW_PARAMS_GIT_ALIAS_COMMIT_FILE}' "$@"; }; f'
    git config $global alias.amend "commit -m --amend"

    # git checkout
    git config $global alias.k checkout

    # git log
    local hash="%C(yellow)%h"
    local time="%C(cyan)[%ar]"
    local author="%C(green)<%<(9,trunc)%aN>"
    local reference="%C(auto)%d"
    local subject="%C(reset)%s"

    local command_log_oneline="log --graph --oneline --decorate --date=short --pretty=format:'${hash} ${time} ${author}${reference} ${subject}'"

    git config $global alias.l "${command_log_oneline} -12"
    git config $global alias.ll "${command_log_oneline}"
    git config $global alias.lfile "${command_log_oneline} --follow"
    git config $global alias.lmerges "${command_log_oneline} --merges"
    git config $global alias.lcount "shortlog -sn"

    # git reset
    git config $global alias.r "reset"
    git config $global alias.hard "reset --hard"
    git config $global alias.undo "reset --soft HEAD^"
    git config $global alias.untracked "clean -f -d"

    # git status
    git config $global alias.s "!sh -c ${GBW_PARAMS_GIT_ALIAS_STATUS_FILE}"

    git config $global alias.ss status

    # git grep
    git config $global alias.find '!f() { '${GBW_PARAMS_GIT_ALIAS_FIND_FILE}' "$@"; }; f'
}

function gbw_git_config_unset_aliases {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    git config $global --unset alias.b
	git config $global --unset alias.d
	git config $global --unset alias.a
	git config $global --unset alias.all
	git config $global --unset alias.nm
	git config $global --unset alias.md
	git config $global --unset alias.c
	git config $global --unset alias.amend
	git config $global --unset alias.k
	git config $global --unset alias.l
	git config $global --unset alias.ll
    git config $global --unset alias.lfile
    git config $global --unset alias.lmerges
	git config $global --unset alias.lcount
	git config $global --unset alias.untracked
	git config $global --unset alias.r
	git config $global --unset alias.hard
	git config $global --unset alias.undo
	git config $global --unset alias.s
	git config $global --unset alias.ss
	git config $global --unset alias.find
}

function gbw_git_aliases_enabled {
    gbw_git_config_set_aliases --global
}

function gbw_git_aliases_disabled {
    gbw_git_config_unset_aliases --global
}