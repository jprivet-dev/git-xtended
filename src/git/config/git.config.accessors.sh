#!/usr/bin/env bash

# TODO: create test
function gwb_git_config_get {
    local key=$1
    local default=$2

    local value="$(git config --global ${key})"

    if [ "${value}" == "" ]; then
        echo "${default}"
        return
    fi

    echo "${value}"
}

# TODO: create test
function gwb_git_config_set {
    git config --global $1 $2
}