#!/usr/bin/env bash

echo
git grep --break --heading --line-number "$@"
echo