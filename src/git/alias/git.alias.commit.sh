#!/usr/bin/env bash

source ~/git-xtended/params/default/params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.sh
source ~/git-xtended/src/git/commands/git.commands.sh
source ~/git-xtended/src/utils/utils.print.sh

indexes=$@
split="--------------------------------------------------"

if [ "${indexes}" == "" -a "$(gx_git_get_status_changes_to_be_committed_count)" == 0 ]; then
  indexes=1
fi

if [[ "${indexes}" =~ ^[0-9]+ ]]; then
  # indexes starts with a number

  status_i=0

  git status -s | cut -c4- | while read path; do
    status_i=$((status_i + 1))
    for i in ${indexes}; do
      if [ "${status_i}" == "${i}" ]; then
        printf "> git add (%s) %s\n" "${i}" "${path}"
        git add "${path}"
      fi
    done
  done
else
  # indexes does not start with a number

  printf "%s\n" "${split}"
  if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
    printf "> git add . (all files)\n"
    git add .
  elif [ "${indexes}" != "" ]; then
    printf "> git add %s files\n" "${indexes}"
    git add ${indexes}
  fi
fi

if [ "$(gx_git_get_status_changes_to_be_committed_count)" == 0 ]; then
  # CAUTION: for the moment, do not insert colors with %s in printf (e.g. C_BG_LIGHT_RED)
  printf "${C_BG_LIGHT_RED} No files to commit !${F_RESET}\n"
  exit 1
fi

printf "> & commit ...\n"

printf "%s\n" "${split}"
git status -s -u
printf "%s\n" "${split}"

gx_hooks_pcmsg "$@"
#git commit -m ""
