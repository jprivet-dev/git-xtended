#!/usr/bin/env bash

# Formatting & Colors

F_BOLD="\e[1m";
F_DIM="\e[2m";
F_UNDERLINED="\e[4m";
F_INVERTED="\e[7m";
F_HIDDEN="\e[8m"
F_RESET="\e[0m"

C_RED="\033[0;31m\]"
C_RED_LITTLE_DARKER="\033[02;36m\]"
C_GREEN="\033[0;32m\]"
C_GREEN_LIGHTER="\033[01;32m\]"
C_ORANGE="\033[0;33m\]"
C_CYAN="\033[0;36m\]"
C_BLUE="\033[02;36m\]"
C_NC="\033[00m\]"

C_BG_MAGENTA="\e[45m\]"
C_BG_NC="\e[0m\]"

function formatting_print_all {
    echo -e "Normal ${F_UNDERLINED}Underlined${F_RESET}"
    echo -e "Normal ${F_DIM}Dim${F_RESET}"
    echo -e "Normal ${F_BOLD}Bold${F_RESET}"
    echo -e "Normal ${F_INVERTED}Inverted${F_RESET}"
    echo -e "Normal ${F_HIDDEN}Hidden${F_RESET}"
    echo -e "End"
}