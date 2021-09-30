#!/usr/bin/env bash

source ~/git-xtended/params/default/params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.params.sh
source ~/git-xtended/src/git/hooks/git.hooks.pcmsg.sh
source ~/git-xtended/src/git/commands/git.commands.sh
source ~/git-xtended/src/utils/utils.print.sh

current_remote_origin_url=$(gx_git_get_current_remote_origin_url)
current_remote_origin_url_last_element=${current_remote_origin_url##*@} # get the string after '@'
url_root="https://${current_remote_origin_url_last_element/:/\/}" # change ':' by '/'
url_root="${url_root/.git/}" # remove '.git'
current_branch=$(gx_git_get_current_branch)
remote_branch_ref=$(gx_git_get_remote_branch_ref)
remote_branch_ref_last_element=${remote_branch_ref##*/} # get the string after '@'

printf "> Compare & Create PR:\n"
printf "> ${url_root}/compare/${remote_branch_ref_last_element}...${current_branch}\n"
printf "\n"
