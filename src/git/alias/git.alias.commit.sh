#!/usr/bin/env bash

_indexes=$@
_split="--------------------------------------------------"

if [ "${_indexes}" == "all" ] || [ "${_indexes}" == "." ]; then
    echo
    git add .
    git status -s -u
    git commit -m ""
    exit 1
fi

if [ "${_indexes}" == "" ]; then
    _indexes=1
fi

_current_index=0

git status -s | cut -c4- | while read line; do
    _current_index=`expr $_current_index + 1`
    if [ "${_current_index}" == "${_indexes}" ]; then
        git add $line

        echo
        echo "${_split}"
        git status -s -u

        echo "${_split}"
        git commit -m ""
    fi
done