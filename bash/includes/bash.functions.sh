#!/usr/bin/env bash

function hello {
    echo "hello"
}

function git_extract_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}