#!/usr/bin/env bash

_status_index=0
while IFS= read -r line; do
    _status_index=$(expr $_status_index + 1)
    echo -e "$_status_index) $line"
done < <(git status --porcelain)