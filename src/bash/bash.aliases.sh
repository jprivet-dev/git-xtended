function gx_bash_aliases_enabled() {
  # avoid error "__git_complete: command not found"
  # @see https://stackoverflow.com/a/47496210/13480534
  [ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

  # @see https://stackoverflow.com/a/24665529
  alias g='git';      __git_complete g        __git_main
  alias gti='git';    __git_complete gti      __git_main # because it could happen to anyone :P

  _GX_PARAMS_BASH_ALIASES_CREATED_BY_GX="${GX_PARAMS_TRUE}"
}

function gx_bash_aliases_disabled() {
  # We only explicitly delete aliases that have been created by GX.
  if [ "${_GX_PARAMS_BASH_ALIASES_CREATED_BY_GX}" == "${GX_PARAMS_TRUE}" ]; then
    unalias g
    unalias gti
    _GX_PARAMS_BASH_ALIASES_CREATED_BY_GX="${GX_PARAMS_FALSE}"
  fi
}
