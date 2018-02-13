#!/usr/bin/env bash

# Formatting & Colors

F_BOLD="\e[1m";
F_DIM="\e[2m";
F_UNDERLINED="\e[4m";
F_INVERTED="\e[7m";
F_HIDDEN="\e[8m"
F_RESET="\e[0m"

C_DEFAULT="\e[39m"
C_BLACK="\e[30m"
C_RED="\e[31m"
C_GREEN="\e[32m"
C_YELLOW="\e[33m"
C_BLUE="\e[34m"
C_MAGENTA="\e[35m"
C_CYAN="\e[36m"
C_LIGHT_GRAY="\e[37m"
C_DARK_GRAY="\e[90m"
C_LIGHT_RED="\e[91m"
C_LIGHT_GREEN="\e[92m"
C_LIGHT_YELLOW="\e[93m"
C_LIGHT_BLUE="\e[94m"
C_LIGHT_MAGENTA="\e[95m"
C_LIGHT_CYAN="\e[96m"
C_WHITE="\e[97m"

C_BG_DEFAULT="\e[49m"
C_BG_BLACK="\e[40m"
C_BG_RED="\e[41m"
C_BG_GREEN="\e[42m"
C_BG_YELLOW="\e[43m"
C_BG_BLUE="\e[44m"
C_BG_MAGENTA="\e[45m"
C_BG_CYAN="\e[46m"
C_BG_LIGHT_GRAY="\e[47m"
C_BG_DARK_GRAY="\e[100m"
C_BG_LIGHT_RED="\e[101m"
C_BG_LIGHT_GREEN="\e[102m"
C_BG_LIGHT_YELLOW="\e[103m"
C_BG_LIGHT_BLUE="\e[104m"
C_BG_LIGHT_MAGENTA="\e[105m"
C_BG_LIGHT_CYAN="\e[106m"
C_BG_WHITE="\e[107m"

function gbw_formatting_print_all {
    echo -e "Normal ${F_UNDERLINED}Underlined${F_RESET}"
    echo -e "Normal ${F_DIM}Dim${F_RESET}"
    echo -e "Normal ${F_BOLD}Bold${F_RESET}"
    echo -e "Normal ${F_INVERTED}Inverted${F_RESET}"
    echo -e "Normal ${F_HIDDEN}Hidden${F_RESET}"

    echo

    echo -e "Default ${C_DEFAULT}Default${F_RESET}"
    echo -e "Default ${C_BLACK}Black${F_RESET}"
    echo -e "Default ${C_RED}Red${F_RESET}"
    echo -e "Default ${C_GREEN}Green${F_RESET}"
    echo -e "Default ${C_YELLOW}Yellow${F_RESET}"
    echo -e "Default ${C_BLUE}Blue${F_RESET}"
    echo -e "Default ${C_MAGENTA}Magenta${F_RESET}"
    echo -e "Default ${C_CYAN}Cyan${F_RESET}"
    echo -e "Default ${C_LIGHT_GRAY}Light gray${F_RESET}"
    echo -e "Default ${C_DARK_GRAY}Dark gray${F_RESET}"
    echo -e "Default ${C_LIGHT_RED}Light red${F_RESET}"
    echo -e "Default ${C_LIGHT_GREEN}Light green${F_RESET}"
    echo -e "Default ${C_LIGHT_YELLOW}Light yellow${F_RESET}"
    echo -e "Default ${C_LIGHT_BLUE}Light blue${F_RESET}"
    echo -e "Default ${C_LIGHT_MAGENTA}Light magenta${F_RESET}"
    echo -e "Default ${C_LIGHT_CYAN}Light cyan${F_RESET}"
    echo -e "Default ${C_WHITE}White${F_RESET}"
    
    echo
    
    echo -e "Default ${C_BG_DEFAULT}Default${F_RESET}"
    echo -e "Default ${C_BG_BLACK}Black${F_RESET}"
    echo -e "Default ${C_BG_RED}Red${F_RESET}"
    echo -e "Default ${C_BG_GREEN}Green${F_RESET}"
    echo -e "Default ${C_BG_YELLOW}Yellow${F_RESET}"
    echo -e "Default ${C_BG_BLUE}Blue${F_RESET}"
    echo -e "Default ${C_BG_MAGENTA}Magenta${F_RESET}"
    echo -e "Default ${C_BG_CYAN}Cyan${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_GRAY}Light gray${F_RESET}"
    echo -e "Default ${C_BG_DARK_GRAY}Dark gray${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_RED}Light red${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_GREEN}Light green${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_YELLOW}Light yellow${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_BLUE}Light blue${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_MAGENTA}Light magenta${F_RESET}"
    echo -e "Default ${C_BG_LIGHT_CYAN}Light cyan${F_RESET}"
    echo -e "Default ${C_BG_WHITE}White${F_RESET}"
}