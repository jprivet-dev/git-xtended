#!/usr/bin/env bash

source ~/git-xtended/params/default/params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.sh
source ~/git-xtended/src/git/commands/git.commands.sh
source ~/git-xtended/src/utils/utils.print.sh

base_branch=${1}

current_remote_origin_url=$(gx_git_get_current_remote_origin_url)
current_remote_origin_url_last_element=${current_remote_origin_url##*@} # get the string after '@'
url_root="https://${current_remote_origin_url_last_element/:/\/}"       # change ':' by '/'
url_root="${url_root/.git/}"                                            # remove '.git'
url_root="${url_root}/compare/"

current_branch=$(gx_git_get_current_branch)

printf "> Compare & Create PR with current branch:\n"

if [ "${base_branch}" != "" ]; then
  printf "> ${url_root}${base_branch}...${current_branch}\n"
else
  remote_main=$(gx_git_get_remote_main)
  remote_main_last_element=${remote_main##*/} # get the string after '@'

  remote_ref_branch=$(gx_git_get_remote_ref_branch)
  remote_ref_branch_last_element=${remote_ref_branch##*/} # get the string after '@'

  printf "> ${url_root}${remote_main_last_element}...${current_branch}\n"
  if [ "${remote_main_last_element}" != "${remote_ref_branch_last_element}" ]; then
    printf "> ${url_root}${remote_ref_branch_last_element}...${current_branch}\n"
  fi
fi

printf "\n"
