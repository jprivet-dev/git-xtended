#!/usr/bin/env bash

indexes=$@
_split="--------------------------------------------------"

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

current_i=0

git status -s | cut -c4- | while read path; do
    current_i=`expr ${current_i} + 1`
    if [ "${current_i}" == "${indexes}" ]; then
        echo "> git add (${indexes}) ${path}"
        git add ${path}
    fi
done

echo "> & commit ..."

echo
echo "${_split}"
git status -s -u

echo "${_split}"
git commit -m ""
