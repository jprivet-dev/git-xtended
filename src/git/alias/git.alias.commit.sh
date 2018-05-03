#!/usr/bin/env bash

indexes=$@
split="--------------------------------------------------"

if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
    echo "> git add all files & commit"
    git add .
    git status -s -u
    git commit -m ""
    exit 1
fi

if [ "${indexes}" == "" ]; then
    indexes=1
fi

status_i=0

git status -s | cut -c4- | while read path; do
    status_i=`expr ${status_i} + 1`
    for i in ${indexes}; do
        if [ "${status_i}" == "${i}" ]; then
            echo "> git add (${i}) ${path}"
            git add ${path}
        fi
    done
done

echo "> & commit ..."

echo
echo "${split}"
git status -s -u

echo "${split}"
git commit -m ""
