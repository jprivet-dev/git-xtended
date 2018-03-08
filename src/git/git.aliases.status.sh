#!/usr/bin/env bash

while IFS= read -r line; do
    INDEX=$(expr $INDEX + 1)
    echo -e "$INDEX) $line"
done < <(git status --porcelain)