#!/usr/bin/env bash

source ~/git-xtended/params/default/params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.sh
source ~/git-xtended/src/git/commands/git.commands.sh
source ~/git-xtended/src/utils/utils.print.sh

if [ "$(gx_git_get_changes_nb)" == 0 ]; then
  printf "${C_BG_LIGHT_RED} No files ! ${F_RESET}\n"
  exit 1
fi

first=$1
split="--------------------------------------------------"

if [ "${first}" == "" ]; then
  first=1
fi

if [[ "${first}" =~ ^[0-9]+ && "${#first}" < 7 ]]; then
  # first param starts with a number (index of file) AND is not a commit reference

  status_i=0

  git status -s | cut -c4- | while read path; do
    status_i=$((status_i + 1))
    for i in ${first}; do
      if [ "${status_i}" == "${i}" ]; then
        is_staged=$(git status --porcelain -s ${path} | grep '^[^? ]' | wc -l 2>/dev/null)
        is_not_staged=$(git status --porcelain -s ${path} | grep '^.[^? ]' | wc -l 2>/dev/null)

        if [ "${is_staged}" == 1 ]; then
          printf "%s\n" "${split}"
          printf "> git diff (%s) %s ${C_BG_GREEN} STAGED VERSION ${F_RESET}\n" ${i} ${path}
          printf "%s\n" "${split}"
          git diff --staged ${path}
        fi

        if [ "${is_not_staged}" == 1 ]; then
          printf "%s\n" "${split}"
          printf "> git diff (%s) %s ${C_BG_RED} NOT STAGED VERSION ${F_RESET}\n" ${i} ${path}
          printf "%s\n" "${split}"
          git diff ${path}
        fi
      fi
    done
  done
else
  # first param is not an index of file

  printf "%s\n" "${split}"
  git diff $@
fi
