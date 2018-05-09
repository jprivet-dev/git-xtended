#!/usr/bin/env bash

count=0
while IFS= read -r line; do
    count=$((${count} + 1))
    printf "%s) %s\n" ${count} "${line}"
done < <(git -c color.status=always status --short)