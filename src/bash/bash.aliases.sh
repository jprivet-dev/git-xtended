#!/usr/bin/env bash

function gbw_bash_aliases_set_all {
    alias g="git"

    if [[ -x "$(git --version)" ]]; then
        # active git autocompletion for 'g' alias
        complete -o default -o nospace -F _git g
    fi

    alias reload="source ~/.bashrc"
    alias reloadp="source ~/.bash_profile"

    alias c="clear"

    alias ls="ls -alF --color=auto"
    alias ls.="ls -d .* --color=auto"

    alias t="source ~/.bashrc; source gbw.tests.sh"
}

