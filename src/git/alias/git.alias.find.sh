#!/usr/bin/env bash

printf "\n"
git grep --break --heading --line-number "$@"
printf "\n"