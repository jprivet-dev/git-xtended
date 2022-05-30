#!/usr/bin/env bash

function gx_git_config_set_aliases() {
  local global="$1"
  [[ "${global}" != "--global" ]] && global=""

  # git branch
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_B} "branch"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_RECENT} "!git branch --sort=-committerdate --format='%(HEAD) %(refname:short);%(committerdate:relative);%(authorname);%(subject)' | column -t -s ';'"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_PREVIOUS} "checkout -"
  # (trick: use `branch -b` instead of `switch -c` for good branch completion)
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_NEW} "checkout -b"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_RENAME} '!f() { \
                                                                 [ -z "$2" ] && o=$(git rev-parse --abbrev-ref HEAD) || o=$1 && n=${2:-$1} \
                                                                 && git branch -m $@ && echo "Rename branch $o to $n" \
                                                             ; }; f'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DELETE} "branch -d"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DELETEF} "branch -D"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DELETER} "push --delete"

  # git diff
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_D} '!f() { '${GX_PARAMS_GIT_ALIAS_DIFF_FILE}' "$@"; }; f'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DD} "diff"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DW} "diff -w --word-diff --color-words"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DS} "diff --staged"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_DSW} "diff --staged -w --word-diff --color-words"

  # git add
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_A} '!f() { '${GX_PARAMS_GIT_ALIAS_ADD_FILE}' "$@"; }; f'

  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_ALL} "add --all"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_NM} "add ."
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_MD} "add --update"

  # git commit
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_C} '!f() { '${GX_PARAMS_GIT_ALIAS_COMMIT_FILE}' "$@"; }; f'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_AMEND} "commit --amend -m"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_NOEDIT} "commit --amend --no-edit"

  # git checkout
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_CK} "checkout"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_RES} '!f() { '${GX_PARAMS_GIT_ALIAS_RESTORE_FILE}' "$@"; }; f'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_SW} "switch"

  # git log
  local hash="%C(yellow)%h"
  local time="%C(cyan)[%ar]"
  local author="%C(green)<%<(9,trunc)%aN>"
  local reference="%C(auto)%d"
  local subject="%C(reset)%s"
  local command_log_oneline="log --graph --oneline --decorate --date=short --pretty=format:'${hash} ${time} ${author}${reference} ${subject}'"

  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_L} "${command_log_oneline} -12"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_LL} "${command_log_oneline}"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_LFILE} "${command_log_oneline} --follow"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_LMERGES} "${command_log_oneline} --merges"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_LCOUNT} "shortlog -sn"

  # git reset
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_R} "reset"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_HARD} "reset --hard"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNDO} "reset --soft HEAD^"

  # git clean
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNTRACKED} "clean -f -d"

  # git status
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_S} "!sh -c ${GX_PARAMS_GIT_ALIAS_STATUS_FILE}"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_SS} "status"

  # git push
  # (trick: start with '!git push ...' for good branch completion)
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_PUSHF} "!git push --force-with-lease"

  # git cherry-pick
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_CP} "cherry-pick"

  # git describe
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_TLAST} "describe --tags --abbrev=0"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_TLIST} "!git tag --list | sort --version-sort"

  # git config
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_CONFGX} "!git config --list | grep ^${GX_PARAMS_GIT_CONFIG_KEY_ROOT}"
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNSET} 'config --unset'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNSET_ALL} 'config --unset-all'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_EDIT} 'config --edit'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNSET_G} 'config --global --unset'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_UNSET_ALL_G} 'config --global --unset-all'
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_EDIT_G} 'config --global --edit'

  # git grep
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_FIND} '!f() { '${GX_PARAMS_GIT_ALIAS_FIND_FILE}' "$@"; }; f'

  # pull request
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_PR} '!f() { '${GX_PARAMS_GIT_ALIAS_PR_FILE}' "$@"; }; f'

  # stats
  git config ${global} alias.${GX_PARAMS_GIT_ALIAS_CONTRIBUTORS} '!git log --format="%aN" | sort -u'
}

function gx_git_config_unset_aliases() {
  local global="$1"
  [[ "${global}" != "--global" ]] && global=""

  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_A}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_ALL}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_AMEND}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_B}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_C}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_CK}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_CONFGX}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_CONTRIBUTORS}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_CP}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_D}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DD}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DELETE}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DELETEF}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DELETER}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DS}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DSW}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_DW}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_EDIT}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_EDIT_G}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_FIND}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_HARD}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_L}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_LCOUNT}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_LFILE}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_LL}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_LMERGES}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_MD}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_NEW}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_NM}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_NOEDIT}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_PR}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_PREVIOUS}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_PUSHF}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_R}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_RECENT}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_RENAME}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_RES}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_S}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_SS}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_SW}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_TLAST}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_TLIST}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNDO}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNSET}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNSET_ALL}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNSET_ALL_G}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNSET_G}
  git config ${global} --unset-all alias.${GX_PARAMS_GIT_ALIAS_UNTRACKED}
}

function gx_git_aliases_enabled() {
  gx_git_config_set_aliases --global
}

function gx_git_aliases_disabled() {
  gx_git_config_unset_aliases --global
}
