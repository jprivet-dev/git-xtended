#!/usr/bin/env bash

_commit_choose_indexes=$@

if [ "$_commit_choose_indexes" == "" ]; then
    echo "> COMMIT ERROR: Choose index !"
elseif [ "$_commit_choose_indexes" == "all" ]
    git add -A
    echo "> ADD: all"
    git commit -m ""
else
    _commit_index=0
    git status -s | cut -c4- | while read line; do
        _commit_index=$(expr $_commit_index + 1)
        if [ "$_commit_index" == "$_commit_choose_indexes" ]; then
            git add $line
            echo "> ADD: $line"
            git commit -m ""
        fi
    done
fi