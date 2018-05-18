#!/usr/bin/env bash

source ~/git-xtended/params/default/params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.sh
source ~/git-xtended/src/git/commands/git.commands.sh
source ~/git-xtended/src/utils/utils.print.sh

indexes=$@
split="--------------------------------------------------"

if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
    printf "> git add all files & commit\n"
    git add .
    printf "> & commit ...\n"

    printf "%s\n" "${split}"
    git status -s -u
    printf "%s\n" "${split}"
    
#    git commit -m ""
    gx_hooks_pcmsg $@
    exit 1
fi

if [ "${indexes}" == "" ]; then
    indexes=1
fi

status_i=0

git status -s | cut -c4- | while read path; do
    status_i=$((status_i + 1))
    for i in ${indexes}; do
        if [ "${status_i}" == "${i}" ]; then
            printf "> git add (%s) %s\n" ${i} ${path}
            git add ${path}
        fi
    done
done

printf "> & commit ...\n"

printf "%s\n" "${split}"
git status -s -u
printf "%s\n" "${split}"

gx_hooks_pcmsg $@
#git commit -m ""
