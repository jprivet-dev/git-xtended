#!/usr/bin/env bash
# shellcheck disable=SC2034
:

GX_PARAMS_GIT_CONFIG_KEY_ROOT="gx"

#GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.githooks"
#GX_PARAMS_GIT_CONFIG_KEY_WORKFLOW="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.workflow"
#GX_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.bashaliases"

GX_PARAMS_GIT_CONFIG_KEY_PROMPT_STATUS="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.prompt-status"
GX_PARAMS_GIT_CONFIG_KEY_GIT_ALIASES_STATUS="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.gitaliases-status"
GX_PARAMS_GIT_CONFIG_KEY_GIT_REMOTE_REF_BRANCH="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.remote-ref-branch"
GX_PARAMS_GIT_CONFIG_KEY_GIT_AUTOLINK_REFERENCE_PREFIX="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.autolink-ref-prefix"
GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SCOPE="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.commit-last-scope"
GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.commit-last-reference"
GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_TYPE_INDEX="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.commit-last-type"
#GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_STATUS="${GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS}.status"
#GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_TYPE="${GX_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS}.type"
#GX_PARAMS_GIT_CONFIG_KEY_WORKFLOW_STATUS="${GX_PARAMS_GIT_CONFIG_KEY_WORKFLOW}.status"
GX_PARAMS_GIT_CONFIG_KEY_BASH_ALIASES_STATUS="${GX_PARAMS_GIT_CONFIG_KEY_ROOT}.bashaliases-status"

GX_PARAMS_GIT_ALIAS_DIFF_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.diff.sh"
GX_PARAMS_GIT_ALIAS_COMMIT_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.commit.sh"
GX_PARAMS_GIT_ALIAS_STATUS_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.status.sh"
GX_PARAMS_GIT_ALIAS_FIND_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.find.sh"
GX_PARAMS_GIT_ALIAS_RESTORE_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.restore.sh"
GX_PARAMS_GIT_ALIAS_ADD_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.add.sh"
GX_PARAMS_GIT_ALIAS_PR_FILE="${GX_PARAMS_ROOT}/src/git/alias/git.alias.pr.sh"

#GX_PARAMS_GIT_HOOKS_DIR="${GX_PARAMS_ROOT}/git/hooks/"

#GX_PARAMS_GIT_HOOKS_TYPE_HOOKSPATH="hookspath"
#GX_PARAMS_GIT_HOOKS_TYPE_SYMLINK="symlink"

GX_PARAMS_GIT_HOOKSPATH_VERSION_MIN="2.9.0"

GX_PARAMS_GIT_ALIAS_A="a"
GX_PARAMS_GIT_ALIAS_ALL="all"
GX_PARAMS_GIT_ALIAS_AMEND="amend"
GX_PARAMS_GIT_ALIAS_B="b"
GX_PARAMS_GIT_ALIAS_C="c"
GX_PARAMS_GIT_ALIAS_CK="ck"
GX_PARAMS_GIT_ALIAS_CONFGX="confgx"
GX_PARAMS_GIT_ALIAS_CONTRIBUTORS="contributors"
GX_PARAMS_GIT_ALIAS_CP="cp"
GX_PARAMS_GIT_ALIAS_D="d"
GX_PARAMS_GIT_ALIAS_DELETE="delete"
GX_PARAMS_GIT_ALIAS_DELETEF="deletef"
GX_PARAMS_GIT_ALIAS_DELETER="deleter"
GX_PARAMS_GIT_ALIAS_DS="ds"
GX_PARAMS_GIT_ALIAS_DSW="dsw"
GX_PARAMS_GIT_ALIAS_DW="dw"
GX_PARAMS_GIT_ALIAS_EDIT="edit"
GX_PARAMS_GIT_ALIAS_EDIT_G="editg"
GX_PARAMS_GIT_ALIAS_FIND="find"
GX_PARAMS_GIT_ALIAS_HARD="hard"
GX_PARAMS_GIT_ALIAS_L="l"
GX_PARAMS_GIT_ALIAS_LCOUNT="lcount"
GX_PARAMS_GIT_ALIAS_LFILE="lfile"
GX_PARAMS_GIT_ALIAS_LL="ll"
GX_PARAMS_GIT_ALIAS_LMERGES="lmerges"
GX_PARAMS_GIT_ALIAS_MD="md"
GX_PARAMS_GIT_ALIAS_NEW="new"
GX_PARAMS_GIT_ALIAS_NM="nm"
GX_PARAMS_GIT_ALIAS_NOEDIT="noedit"
GX_PARAMS_GIT_ALIAS_PR="pr"
GX_PARAMS_GIT_ALIAS_PREVIOUS="previous"
GX_PARAMS_GIT_ALIAS_PUSHF="pushf"
GX_PARAMS_GIT_ALIAS_R="r"
GX_PARAMS_GIT_ALIAS_RECENT="recent"
GX_PARAMS_GIT_ALIAS_RENAME="rename"
GX_PARAMS_GIT_ALIAS_RES="res"
GX_PARAMS_GIT_ALIAS_S="s"
GX_PARAMS_GIT_ALIAS_SS="ss"
GX_PARAMS_GIT_ALIAS_SW="sw"
GX_PARAMS_GIT_ALIAS_TLAST="tlast"
GX_PARAMS_GIT_ALIAS_TLIST="tlist"
GX_PARAMS_GIT_ALIAS_UNDO="undo"
GX_PARAMS_GIT_ALIAS_UNSET="unset"
GX_PARAMS_GIT_ALIAS_UNSET_ALL="unsetall"
GX_PARAMS_GIT_ALIAS_UNSET_ALL_G="unsetallg"
GX_PARAMS_GIT_ALIAS_UNSET_G="unsetg"
GX_PARAMS_GIT_ALIAS_UNTRACKED="untracked"
