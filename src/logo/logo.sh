#!/usr/bin/env bash

function gx_logo_color() {
    # CAUTION: for the moment, do not insert colors with %s in printf (e.g. C_LIGHT_YELLOW)
    printf "${C_LIGHT_YELLOW}%s${F_RESET}\n"    " _____ _ _      __ __ _             _       _"
    printf "${C_LIGHT_GREEN}%s${F_RESET}\n"     "|   __|_| |_   |  |  | |_ ___ ___ _| |___ _| |"
    printf "${C_LIGHT_BLUE}%s${F_RESET}\n"      "|  |  | |  _|  |-   -|  _| ._|   | . | ._| . |"
    printf "${C_LIGHT_MAGENTA}%s${F_RESET}\n"   "\_____|_|_|    |__|__|_| |___|_|_|___|___|___/"
}
