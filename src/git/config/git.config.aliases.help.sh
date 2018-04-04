#!/usr/bin/env bash

function gbw_git_config_aliases_help {
    local cat
    local select_file="(select file with ${F_UNDERLINED}index${F_RESET} status instead of path)"

    gbw_print_colors "${C_WHITE}${GBW_PARAMS_LABEL_GIT_ALIASES}${F_RESET} :"
    gbw_git_config_aliases_help_line "     log |" "l" "" ................. "Show the last 12 commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "ll" "" ................ "Show all commit logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "lfile"  "<file>" ...... "Show all commit logs for a specific file (graphical representation)"
    gbw_git_config_aliases_help_line "          " "lmerges" "" ........... "Show all merge logs (graphical representation)"
    gbw_git_config_aliases_help_line "          " "lcount" "" ............ "Number of commits per author"
    gbw_git_config_aliases_help_line "  branch |" "b" "" ................. "Simple \"branch\" alias"
    gbw_git_config_aliases_help_line "checkout |" "k" "" ................. "Simple \"checkout\" alias"
    gbw_git_config_aliases_help_line "  status |" "s" "" ................. "${F_UNDERLINED}Indexed${F_RESET} status list (staged, unstaged, and untracked files)"
    gbw_git_config_aliases_help_line "          " "ss" "" ................ "Simple \"status\" alias"
    gbw_git_config_aliases_help_line "    diff |" "d"  "[1 2 ... n]" ..... "Extended \"diff\" alias ${select_file}"
    gbw_git_config_aliases_help_line "     add |" "a"  "[1 2 ... n]" ..... "Extended \"add\" alias ${select_file}"
    gbw_git_config_aliases_help_line "          " "all" "" ............... "Add all files (new, modified and deleted)"
    gbw_git_config_aliases_help_line "          " "nm" "" ................ "Add new and modified files, without deleted"
    gbw_git_config_aliases_help_line "          " "md" "" ................ "Add modified and deleted files, without new"
    gbw_git_config_aliases_help_line "  commit |" "c"  "[1 2 ... n]" ..... "Extended \"commit\" alias ${select_file}"
    gbw_git_config_aliases_help_line "          " "amend" "" ............. "Oops level 1! Modify the last commit"
    gbw_git_config_aliases_help_line "   reset |" "r" "" ................. "Simple \"reset\" alias"
    gbw_git_config_aliases_help_line "          " "hard"  "[<commit>]" ... "Simple \"reset --hard\" alias (by default, discard any changes to ${F_UNDERLINED}tracked${F_RESET} files, since last commit)"
    gbw_git_config_aliases_help_line "          " "undo" "" .............. "Oops level 2! Undo the last commit, while keeping files changes"
    gbw_git_config_aliases_help_line "   clean |" "untracked" "" ......... "Remove all ${F_UNDERLINED}untracked${F_RESET} files"
    gbw_git_config_aliases_help_line "    grep |" "find"  "<string>" ..... "Look for specified strings in the tracked files (case sensitive)"
    echo
}

function gbw_git_config_aliases_help_line {
    local option
    [ "$3" == "" ] && option=" " || option=" $3 "
    gbw_print_colors "${GBW_PARAMS_TAB}$1 git ${C_LIGHT_CYAN}$2${F_RESET}${option}${C_DARK_GRAY}$4${F_RESET} $5"
}