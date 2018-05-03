#!/usr/bin/env bash

function gbw_git_config_aliases_help {
    local cat
    local select_file="(select file with ${F_UNDERLINED}index${F_RESET} status instead of path)"

    gbw_print_colors "${C_WHITE}${GBW_PARAMS_LABEL_GIT_ALIASES}${F_RESET} :"
    gbw_git_config_aliases_help_line "     log |" "${GBW_PARAMS_GIT_ALIAS_L}" "" ................. "Show the last 12 commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_LL}" "" ................ "Show all commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_LFILE}"  "<file>" ...... "Show all commit logs for a specific file (graphical representation)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_LMERGES}" "" ........... "Show all merge logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_LCOUNT}" "" ............ "Number of commits per author"
    gbw_git_config_aliases_help_line "  branch |" "${GBW_PARAMS_GIT_ALIAS_B}" "" ................. "Simple \"branch\" alias"
    gbw_git_config_aliases_help_line "checkout |" "${GBW_PARAMS_GIT_ALIAS_CK}" "" ................ "Simple \"checkout\" alias"
    gbw_git_config_aliases_help_line "  status |" "${GBW_PARAMS_GIT_ALIAS_S}" "" ................. "${F_UNDERLINED}Indexed${F_RESET} status list (staged, unstaged, and untracked files)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_SS}" "" ................ "Simple \"status\" alias"
    gbw_git_config_aliases_help_line "    diff |" "${GBW_PARAMS_GIT_ALIAS_D}"  "[1 2 ... n]" ..... "Extended \"diff\" alias ${select_file}"
    gbw_git_config_aliases_help_line "     add |" "${GBW_PARAMS_GIT_ALIAS_A}"  "[1 2 ... n]" ..... "Extended \"add\" alias ${select_file}"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_ALL}" "" ............... "Add all files (new, modified and deleted)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_NM}" "" ................ "Add new and modified files, without deleted"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_MD}" "" ................ "Add modified and deleted files, without new"
    gbw_git_config_aliases_help_line "  commit |" "${GBW_PARAMS_GIT_ALIAS_C}"  "[1 2 ... n]" ..... "Extended \"commit\" alias ${select_file}"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_AMEND}" "" ............. "Oops level 1! Modify the last commit"
    gbw_git_config_aliases_help_line "   reset |" "${GBW_PARAMS_GIT_ALIAS_R}" "" ................. "Simple \"reset\" alias"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_HARD}"  "[<commit>]" ... "Simple \"reset --hard\" alias (by default, discard any changes to ${F_UNDERLINED}tracked${F_RESET} files, since last commit)"
    gbw_git_config_aliases_help_line "          " "${GBW_PARAMS_GIT_ALIAS_UNDO}" "" .............. "Oops level 2! Undo the last commit, while keeping files changes"
    gbw_git_config_aliases_help_line "   clean |" "${GBW_PARAMS_GIT_ALIAS_UNTRACKED}" "" ......... "Remove all ${F_UNDERLINED}untracked${F_RESET} files"
    gbw_git_config_aliases_help_line "    grep |" "${GBW_PARAMS_GIT_ALIAS_FIND}"  "<string>" ..... "Look for specified strings in the tracked files (case sensitive)"
    echo
}

function gbw_git_config_aliases_help_line {
    local option
    [ "$3" == "" ] && option=" " || option=" $3 "
    gbw_print_colors "${GBW_PARAMS_TAB}$1 git ${C_LIGHT_CYAN}$2${F_RESET}${option}${C_DARK_GRAY}$4${F_RESET} $5"
}