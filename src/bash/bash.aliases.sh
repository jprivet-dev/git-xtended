#!/usr/bin/env bash

function gx_bash_aliases_enabled() {
  # avoid error "__git_complete: command not found"
  # @see https://stackoverflow.com/a/47496210/13480534
  [ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

  # @see https://stackoverflow.com/a/24665529
  alias ${GX_PARAMS_BASH_ALIAS_G}="git";      __git_complete ${GX_PARAMS_BASH_ALIAS_G}    __git_main
  alias ${GX_PARAMS_BASH_ALIAS_GTI}="git";    __git_complete ${GX_PARAMS_BASH_ALIAS_GTI}  __git_main

  _GX_PARAMS_BASH_ALIASES_CREATED_BY_GX="${GX_PARAMS_TRUE}"
}

function gx_bash_aliases_disabled() {
  # We only explicitly delete aliases that have been created by GX.
  if [ "${_GX_PARAMS_BASH_ALIASES_CREATED_BY_GX}" == "${GX_PARAMS_TRUE}" ]; then
    unalias ${GX_PARAMS_BASH_ALIAS_G}
    unalias ${GX_PARAMS_BASH_ALIAS_GTI}
    _GX_PARAMS_BASH_ALIASES_CREATED_BY_GX="${GX_PARAMS_FALSE}"
  fi
}
