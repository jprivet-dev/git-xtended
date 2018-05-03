#!/usr/bin/env bash

count=0
while IFS= read -r line; do
    count=`expr ${count} + 1`
    echo -e "${count}) ${line}"
done < <(git -c color.status=always status --short)