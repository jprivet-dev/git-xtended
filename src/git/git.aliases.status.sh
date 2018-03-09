#!/usr/bin/env bash

_index=0
while IFS= read -r line; do
    _index=$(expr $_index + 1)
    echo -e "$_index) $line"
done < <(git status --porcelain)