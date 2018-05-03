#!/usr/bin/env bash

_indexes=$1

if [ "${_indexes}" == "" ]; then
    echo "which file(s) would you want to restore ?"
    while IFS= read -r line; do
        _index=`expr $_index + 1`
        echo -e "${_index}) ${line}"
    done < <(git status --porcelain)
else
    _current_index=0

    git status -s | cut -c4- | while read path; do
        _current_index=`expr $_current_index + 1`
        if [ "${_current_index}" == "${_indexes}" ]; then
            echo "> git checkout (${_indexes}) ${path}"
            git checkout ${path}
        fi
    done
fi

