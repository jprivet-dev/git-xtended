#!/usr/bin/env bash

indexes=$@

if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
    git diff
    exit 1
fi

if [ "${indexes}" == "" ]; then
    indexes="1"
fi

status_i=0

git status -s | cut -c4- | while read path; do
    status_i=$((status_i + 1))
    for i in ${indexes}; do
        if [ "${status_i}" == "${i}" ]; then
            printf "> git diff (%s) %s\n" ${i} ${path}
            git diff ${path}
        fi
    done
done
