#!/usr/bin/env bash

_index=$1

if [ "${_index}" == "all" ] || [ "${_index}" == "." ]; then
    git diff
    exit 1
fi

if [ "${_index}" == "" ]; then
    _index="1"
fi

_current_index=0

git status -s | cut -c4- | while read line; do
    _current_index=$(expr $_current_index + 1)
    if [ "${_current_index}" == "${_index}" ]; then
        git diff $line
    fi
done