#!/usr/bin/env bash

function gx_git_config_set_aliases {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    # git branch
    git config ${global} alias.b branch

    # git diff
    git config ${global} alias.d '!f() { '${GBW_PARAMS_GIT_ALIAS_DIFF_FILE}' "$1"; }; f'

    # git add
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_A} '!f() { '${GBW_PARAMS_GIT_ALIAS_ADD_FILE}' "$@"; }; f'

    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_ALL} "add --all"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_NM} "add ."
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_MD} "add --update"

    # git commit
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_C} '!f() { '${GBW_PARAMS_GIT_ALIAS_COMMIT_FILE}' "$@"; }; f'
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_AMEND} "commit -m --amend"

    # git checkout
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_CK} '!f() { '${GBW_PARAMS_GIT_ALIAS_CHECKOUT_FILE}' "$@"; }; f'

    # git log
    local hash="%C(yellow)%h"
    local time="%C(cyan)[%ar]"
    local author="%C(green)<%<(9,trunc)%aN>"
    local reference="%C(auto)%d"
    local subject="%C(reset)%s"

    local command_log_oneline="log --graph --oneline --decorate --date=short --pretty=format:'${hash} ${time} ${author}${reference} ${subject}'"

    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_L} "${command_log_oneline} -12"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_LL} "${command_log_oneline}"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_LFILE} "${command_log_oneline} --follow"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_LMERGES} "${command_log_oneline} --merges"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_LCOUNT} "shortlog -sn"

    # git reset
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_R} "reset"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_HARD} "reset --hard"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_UNDO} "reset --soft HEAD^"
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_UNTRACKED} "clean -f -d"

    # git status
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_S} "!sh -c ${GBW_PARAMS_GIT_ALIAS_STATUS_FILE}"

    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_SS} status

    # git grep
    git config ${global} alias.${GBW_PARAMS_GIT_ALIAS_FIND} '!f() { '${GBW_PARAMS_GIT_ALIAS_FIND_FILE}' "$@"; }; f'
}

function gx_git_config_unset_aliases {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_B}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_D}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_A}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_ALL}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_NM}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_MD}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_C}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_AMEND}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_CK}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_L}}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_LL}
    git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_LFILE}
    git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_LMERGES}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_LCOUNT}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_UNTRACKED}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_R}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_HARD}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_UNDO}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_S}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_SS}
	git config ${global} --unset alias.${GBW_PARAMS_GIT_ALIAS_FIND}
}

function gx_git_aliases_enabled {
    gx_git_config_set_aliases --global
}

function gx_git_aliases_disabled {
    gx_git_config_unset_aliases --global
}