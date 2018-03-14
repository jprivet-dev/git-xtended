#!/usr/bin/env bash

function gbw_git_config_set_aliases {
    local global="$1"
    [[ "$global" != "--global" ]] && global=""

    # git branch
    git config $global alias.b branch

    # git diff
    git config $global alias.d '!f() { '$GBW_PARAMS_GIT_ALIAS_DIFF_FILE' "$1"; }; f'

    # git add
    git config $global alias.a "add"
    git config $global alias.all "add --all"
    git config $global alias.nm "add ."
    git config $global alias.md "add --update"

    # git commit
    git config $global alias.c '!f() { '$GBW_PARAMS_GIT_ALIAS_COMMIT_FILE' "$@"; }; f'
    git config $global alias.amend "commit -m --amend"

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
    git config $global alias.hard "git reset --hard'"
    git config $global alias.undo "reset --soft HEAD^"
    git config $global alias.untracked "clean -f -d"

    # git status
    git config $global alias.s "!sh -c $GBW_PARAMS_GIT_ALIAS_STATUS_FILE"

    git config $global alias.ss status

    # git grep
    git config $global alias.sniffer "grep --break --heading --line-number --extended-regexp 'dump\(|console\.[^(]+\('"
}

function gbw_git_config_unset_aliases {
    local global="$1"
    [[ "$global" != "--global" ]] && global=""

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
	git config $global --unset alias.lcount
	git config $global --unset alias.untracked
	git config $global --unset alias.r
	git config $global --unset alias.hard
	git config $global --unset alias.undo
	git config $global --unset alias.s
	git config $global --unset alias.ss
	git config $global --unset alias.sniffer
}

function gbw_git_aliases_on {
    gbw_git_config_set_aliases --global
}

function gbw_git_aliases_off {
    gbw_git_config_unset_aliases --global
}

function gbw_git_config_aliases_help {
    local cat
    local select_file="(select file with ${F_UNDERLINED}index${F_RESET} status instead of path)"

    echo "$GBW_PARAMS_LABEL_GIT_ALIASES :"
    gbw_git_config_aliases_help_line "     log |" "l" ............... "Show the last 10 commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "ll" .............. "Show all commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "lcount" .......... "Number of commits per author"
    gbw_git_config_aliases_help_line "  branch |" "b" ............... "Simple \"branch\" alias"
    gbw_git_config_aliases_help_line "checkout |" "k" ............... "Simple \"checkout\" alias"
    gbw_git_config_aliases_help_line "  status |" "s" ............... "${F_UNDERLINED}Indexed${F_RESET} status list (staged, unstaged, and untracked files)"
    gbw_git_config_aliases_help_line "          " "ss" .............. "Simple \"status\" alias"
    gbw_git_config_aliases_help_line "    diff |" "d [<indexes>]" ... "Extended \"diff\" alias $select_file"
    gbw_git_config_aliases_help_line "     add |" "a [<indexes>]" ... "Extended \"add\" alias $select_file"
    gbw_git_config_aliases_help_line "          " "all" ............. "Add all files (new, modified and deleted)"
    gbw_git_config_aliases_help_line "          " "nm" .............. "Add new and modified files, without deleted"
    gbw_git_config_aliases_help_line "          " "md" .............. "Add modified and deleted files, without new"
    gbw_git_config_aliases_help_line "  commit |" "c [<indexes>]" ... "Extended \"commit\" alias $select_file"
    gbw_git_config_aliases_help_line "          " "amend" ........... "Oups level 1! Modify the last commit"
    gbw_git_config_aliases_help_line "   reset |" "r" ............... "Simple \"reset\" alias"
    gbw_git_config_aliases_help_line "          " "hard" ............ "Description"
    gbw_git_config_aliases_help_line "          " "undo" ............ "Oups level 2! Undo the last commit, while keeping files changes"
    gbw_git_config_aliases_help_line "   clean |" "untracked" ....... "Description"
    gbw_git_config_aliases_help_line "    grep |" "sniffer" ......... "Description"
    echo
}

function gbw_git_config_aliases_help_line {
    echo -e "${GBW_PARAMS_TAB}$1 git ${C_LIGHT_CYAN}$2${F_RESET} $3 $4"
}