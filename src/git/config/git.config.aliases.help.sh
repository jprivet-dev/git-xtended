#!/usr/bin/env bash

function gx_git_config_aliases_help() {
  local status=""
  if [ "${GX_PARAMS_INSTALL_GIT_ALIASES_STATUS}" == "${GX_PARAMS_DISABLED}" ]; then
    status=" (${GX_PARAMS_DISABLED_UPPERCASE})"
  fi

  local select_file="(select file with index status instead of path)"

  gx_print_colors "${C_WHITE}  # ${GX_PARAMS_GIT_ALIASES_TITLE}${status}${F_RESET} :"
  gx_git_config_aliases_help_line "         log |" "${GX_PARAMS_GIT_ALIAS_L}" "" ........................... "Show the last 12 commit logs (graphical representation)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LL}" "" .......................... "Show all commit logs (graphical representation)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LFILE}" "<file>" ................ "Show all commit logs for a specific file (graphical representation)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LMERGES}" "" ..................... "Show all merge logs (graphical representation)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LCOUNT}" "" ...................... "Number of commits per author"
  gx_git_config_aliases_help_line "      branch |" "${GX_PARAMS_GIT_ALIAS_B}" "" ........................... "Simple \"branch\" alias"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_RECENT}" "" ...................... "Show all local branches ordered by recent commits"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_PREVIOUS}" "" .................... "Quickly switch to the previous branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_NEW}" "<branch> [<remote>/<b>]" . "Create and switch on new branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_RENAME}" "[<branch>] <name>" .... "Rename one local branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETE}" "<branch>" ............. "Delete local branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETEF}" "<branch>" ............ "Forcefully delete local branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETER}" "<remote> <branch>" ... "Delete remote branch"
  gx_git_config_aliases_help_line "    checkout |" "${GX_PARAMS_GIT_ALIAS_CK}" "" .......................... "Simple \"checkout\" alias"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_RES}" "[<i>|<path>]" ............ "${F_UNDERLINED}Indexed${F_RESET} \"restore\" command ${select_file}"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_SW}" "" .......................... "Simple \"switch\" alias"
  gx_git_config_aliases_help_line "      status |" "${GX_PARAMS_GIT_ALIAS_S}" "" ........................... "${F_UNDERLINED}Indexed${F_RESET} status list (staged, unstaged, and untracked files)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_SS}" "" .......................... "Simple \"status\" alias"
  gx_git_config_aliases_help_line "        diff |" "${GX_PARAMS_GIT_ALIAS_D}" "[<i>|<path>]" .............. "${F_UNDERLINED}Indexed${F_RESET} \"diff\" command ${select_file}"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DD}" "" .......................... "Simple \"diff\" alias"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DW}" "[<path>]" ................. "Show changes (ignore whitespace / word diff / without [-...-]{+...+})"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DS}" "[<path>]" ................. "Show changes staged for commit"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DSW}" "[<path>]" ................ "Show changes staged for commit, like 'dw'"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_ONEDAY}" "" ...................... "Comparisons over the last 24 hours"
  gx_git_config_aliases_help_line "         add |" "${GX_PARAMS_GIT_ALIAS_A}" "[<i>|<path>]" .............. "${F_UNDERLINED}Indexed${F_RESET} \"add\" command ${select_file}"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_ALL}" "" ......................... "Add all files (new, modified and deleted)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_NM}" "" .......................... "Add new and modified files, without deleted"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_MD}" "" .......................... "Add modified and deleted files, without new"
  gx_git_config_aliases_help_line "      commit |" "${GX_PARAMS_GIT_ALIAS_C}" "[<i>|<path>|all]" .......... "${F_UNDERLINED}Indexed${F_RESET} \"commit\" command ${select_file}"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_AMEND}" "" ....................... "Modify message of the previous commit"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_NOEDIT}" "" ...................... "Modify previous commit without modifying the commit message"
  gx_git_config_aliases_help_line "       reset |" "${GX_PARAMS_GIT_ALIAS_R}" "" ........................... "Simple \"reset\" alias"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_HARD}" "[<commit>]" ............. "Simple \"reset --hard\" alias (by default, discard any changes to ${F_UNDERLINED}tracked${F_RESET} files, since last commit)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_UNDO}" "" ........................ "Undo the last commit, while keeping files changes"
  gx_git_config_aliases_help_line "       clean |" "${GX_PARAMS_GIT_ALIAS_UNTRACKED}" "" ................... "Remove all ${F_UNDERLINED}untracked${F_RESET} files"
  gx_git_config_aliases_help_line "        push |" "${GX_PARAMS_GIT_ALIAS_PUSHF}" "[<remote> <branch>]" ... "Push force in safety mode"
  gx_git_config_aliases_help_line " cherry pick |" "${GX_PARAMS_GIT_ALIAS_CP}" "" .......................... "Simple \"cherry-pick\" alias"
  gx_git_config_aliases_help_line "        tags |" "${GX_PARAMS_GIT_ALIAS_TLAST}" "" ....................... "Show the most recent tag on the current branch"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_TLIST}" "" ....................... "Display tags in natural order"
  gx_git_config_aliases_help_line "      config |" "${GX_PARAMS_GIT_ALIAS_CONFGX}" "" ...................... "Show ${GX_PARAMS_GX_TITLE_SHORT} git configuration (as '$ gx config')"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_UNSET}" "" ....................... "Remove the line matching the key from config file (local)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_UNSET_ALL}" "" .................... "Remove all lines matching the key from config file (local)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_EDIT}" "" ........................ "Open an editor to modify the specified config file (local)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_UNSET_G}" "" ...................... "Remove the line matching the key from config file (global)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_UNSET_ALL_G}" "" ................... "Remove all lines matching the key from config file (global)"
  gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_EDIT_G}" "" ....................... "Opens an editor to modify the specified config file (global)"
  gx_git_config_aliases_help_line "        grep |" "${GX_PARAMS_GIT_ALIAS_FIND}" "<string>" ............... "Look for specified strings in the tracked files (case sensitive)"
  gx_git_config_aliases_help_line "pull request |" "${GX_PARAMS_GIT_ALIAS_PR}" "[<base>]" ................. "Generate the url to compare and create a PR with the current branch"
  gx_git_config_aliases_help_line "       stats |" "${GX_PARAMS_GIT_ALIAS_CONTRIBUTORS}" "" ................ "Get the list of contributors for the current repository"
  echo
}

function gx_git_config_aliases_help_line() {
  local option
  [ "$3" == "" ] && option=" " || option=" $3 "
  gx_print_colors "${GX_PARAMS_TAB}$1 git ${C_LIGHT_BLUE}$2${F_RESET}${option}${C_DARK_GRAY}$4${F_RESET} $5"
}
