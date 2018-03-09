#!/usr/bin/env bash

_commit_choose_indexes=$@
_active_git_status=0
_split="--------------------------------------------------"

if [ "$_commit_choose_indexes" == "all" ] || [ "$_commit_choose_indexes" == "." ]; then
    echo
    git add .
    git status -s -u
    git commit -m ""
    exit 1
fi

if [ "$_commit_choose_indexes" == "" ]; then
    _active_git_status=1
    _commit_choose_indexes=1
fi

_commit_index=0

git status -s | cut -c4- | while read line; do
    _commit_index=$(expr $_commit_index + 1)
    if [ "$_commit_index" == "$_commit_choose_indexes" ]; then
        if [ "$_active_git_status" == 1 ]; then
            echo "$_split"
            git diff $line
        fi

        git add $line

        echo
        echo "$_split"
        git status -s -u

        echo "$_split"
        git commit -m ""
    fi
done