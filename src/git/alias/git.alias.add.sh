#!/usr/bin/env bash

indexes=$@

if [ "${indexes}" == "" ]; then
    printf "which file(s) would you want to add ?\n"
    source ~/git-xtended/src/git/alias/git.alias.status.sh
    exit 1
fi

if [[ "${indexes}" =~ ^[0-9]+ ]]; then
   # indexes starts with a number

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
else
   # indexes does not start with a number

   if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
       printf "> git add . (all files)\n"
       git add .
   elif [ "${indexes}" != "" ]; then
       printf "> git add ${indexes} files\n"
       git add ${indexes}
   fi
fi
