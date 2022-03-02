#!/usr/bin/env bash

function gx_git_config_aliases_help() {
    local select_file="(select file with index status instead of path)"

    gx_print_colors "${C_WHITE}  # ${GX_PARAMS_LABEL_GIT_ALIASES}${F_RESET} :"
    gx_git_config_aliases_help_line "         log |" "${GX_PARAMS_GIT_ALIAS_L}" "" ........................... "Show the last 12 commit logs (graphical representation)"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LL}" "" .......................... "Show all commit logs (graphical representation)"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LFILE}" "<file>" ................ "Show all commit logs for a specific file (graphical representation)"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LMERGES}" "" ..................... "Show all merge logs (graphical representation)"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_LCOUNT}" "" ...................... "Number of commits per author"
    gx_git_config_aliases_help_line "      branch |" "${GX_PARAMS_GIT_ALIAS_B}" "" ........................... "Simple \"branch\" alias"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_RECENT}" "" ...................... "Show all local branches ordered by recent commits"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETE}" "<branch>" ............. "Delete local branch"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETEF}" "<branch>" ............ "Forcefully delete local branch"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DELETER}" "<remote> <branch>" ... "Delete remote branch"
    gx_git_config_aliases_help_line "    checkout |" "${GX_PARAMS_GIT_ALIAS_CK}" "" .......................... "Simple \"checkout\" alias"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_RES}" "[<i>|<path>]" ............ "${F_UNDERLINED}Indexed${F_RESET} \"restore\" command ${select_file}"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_SW}" "" .......................... "Simple \"switch\" alias"
    gx_git_config_aliases_help_line "      status |" "${GX_PARAMS_GIT_ALIAS_S}" "" ........................... "${F_UNDERLINED}Indexed${F_RESET} status list (staged, unstaged, and untracked files)"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_SS}" "" .......................... "Simple \"status\" alias"
    gx_git_config_aliases_help_line "        diff |" "${GX_PARAMS_GIT_ALIAS_D}" "[<i>|<path>]" .............. "${F_UNDERLINED}Indexed${F_RESET} \"diff\" command ${select_file}"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DW}" "[<path>]" ................. "Show changes (ignore whitespace / word diff / without [-...-]{+...+})"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DS}" "[<path>]" ................. "Show changes staged for commit"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_DSW}" "[<path>]" ................ "Show changes staged for commit, like 'dw'"
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
    gx_git_config_aliases_help_line " cherry pick |" "${GX_PARAMS_GIT_ALIAS_CP}" "" .......................... "Simple \"cherry-pick\" alias"
    gx_git_config_aliases_help_line "        tags |" "${GX_PARAMS_GIT_ALIAS_TLAST}" "" ....................... "Show the most recent tag on the current branch"
    gx_git_config_aliases_help_line "              " "${GX_PARAMS_GIT_ALIAS_TLIST}" "" ....................... "Display tags in natural order"
    gx_git_config_aliases_help_line "        grep |" "${GX_PARAMS_GIT_ALIAS_FIND}" "<string>" ............... "Look for specified strings in the tracked files (case sensitive)"
    gx_git_config_aliases_help_line "pull request |" "${GX_PARAMS_GIT_ALIAS_PR}" "[<base>]" ................. "Generates the url to compare and create a PR with the current branch"
    echo
}

function gx_git_config_aliases_help_line() {
    local option
    [ "$3" == "" ] && option=" " || option=" $3 "
    gx_print_colors "${GX_PARAMS_TAB}$1 git ${C_LIGHT_BLUE}$2${F_RESET}${option}${C_DARK_GRAY}$4${F_RESET} $5"
}
