#!/usr/bin/env bash

function gbw_bash_aliases_enabled {
    alias g="git"

    if [[ -x "`git --version`" ]]; then
        # active git autocompletion for 'g' alias
        complete -o default -o nospace -F _git g
    fi

    alias reload="source ~/.bashrc"
    alias reloadp="source ~/.bash_profile"

    alias c="clear"

    alias ls="ls -alF --color=auto"
    alias ls.="ls -d .* --color=auto"
}

function gbw_bash_aliases_disabled {
    unalias g

    unalias reload
    unalias reloadp

    unalias c

    unalias ls
    unalias ls.
}

