#!/usr/bin/env bash

indexes=$@

if [ "${indexes}" == "" ]; then
    echo "which file(s) would you want to restore ?"
    while IFS= read -r line; do
        count=`expr ${count} + 1`
        echo -e "${count}) ${line}"
    done < <(git status --porcelain)
else
    status_i=0

    git status -s | cut -c4- | while read path; do
        status_i=`expr ${status_i} + 1`
        for i in ${indexes}; do
            if [ "${status_i}" == "${i}" ]; then
                echo "> git checkout (${i}) ${path}"
                git checkout ${path}
            fi
        done
    done
fi

