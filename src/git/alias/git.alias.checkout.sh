#!/usr/bin/env bash

indexes=$@

if [ "${indexes}" == "" ]; then
    printf "which file(s) would you want to restore ?\n"
    source ~/git-xtended/src/git/alias/git.alias.status.sh
    exit 1
fi

status_i=0

git status -s | cut -c4- | while read path; do
    status_i=$(expr ${status_i} + 1)
    for i in ${indexes}; do
        if [ "${status_i}" == "${i}" ]; then
            printf "> git checkout (%s) %s\n" ${i} ${path}
            git checkout ${path}
        fi
    done
done

