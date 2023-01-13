#!/usr/bin/env bash

function gx_logo_color() {
  function line() {
    local color="$1"
    local text="$2"

    printf "%b%s%b\n" "${color}" "${text}" "${F_RESET}"
  }

  line "${C_LIGHT_YELLOW}"  " _____ _ _      __ __ _             _       _"
  line "${C_LIGHT_GREEN}"   "|   __|_| |_   |  |  | |_ ___ ___ _| |___ _| |"
  line "${C_LIGHT_BLUE}"    "|  |  | |  _|  |-   -|  _| ._|   | . | ._| . |"
  line "${C_LIGHT_MAGENTA}" "\_____|_|_|    |__|__|_| |___|_|_|___|___|___/"
}
