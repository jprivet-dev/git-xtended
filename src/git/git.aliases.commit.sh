#!/usr/bin/env bash

_commit_choose_indexes=$@

if [ "$_commit_choose_indexes" == "" ]; then
    echo "> COMMIT ERROR: Choose index !"
elif [ "$_commit_choose_indexes" == "all" ]; then
    git add .
    git status -s -u
    git commit -m ""
else
    _commit_index=0
    git status -s | cut -c4- | while read line; do
        _commit_index=$(expr $_commit_index + 1)
        if [ "$_commit_index" == "$_commit_choose_indexes" ]; then
            git add $line
            git status -s -u
            git commit -m ""
        fi
    done
fi