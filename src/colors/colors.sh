#!/usr/bin/env bash

function gx_colors_print_all() {
  echo -n "${F_UNDERLINED} ..... ";       echo -e "${F_UNDERLINED}Underlined${F_RESET}"
  echo -n "${F_DIM} ..... ";              echo -e "${F_DIM}Dim${F_RESET}"
  echo -n "${F_BOLD} ..... ";             echo -e "${F_BOLD}Bold${F_RESET}"
  echo -n "${F_INVERTED} ..... ";         echo -e "${F_INVERTED}Inverted${F_RESET}"
  echo -n "${F_HIDDEN} ..... ";           echo -e "[Hidden] ${F_HIDDEN}Hidden${F_RESET}"

  echo
  echo "Colors"
  echo

  echo -n "${C_DEFAULT} .... ";          echo -e "${C_DEFAULT}Default${F_RESET}"
  echo -n "${C_BLACK} .... ";            echo -e "[Black] ${C_BLACK}Black${F_RESET}"
  echo -n "${C_RED} .... ";              echo -e "${C_RED}Red${F_RESET}"
  echo -n "${C_GREEN} .... ";            echo -e "${C_GREEN}Green${F_RESET}"
  echo -n "${C_YELLOW} .... ";           echo -e "${C_YELLOW}Yellow${F_RESET}"
  echo -n "${C_BLUE} .... ";             echo -e "${C_BLUE}Blue${F_RESET}"
  echo -n "${C_MAGENTA} .... ";          echo -e "${C_MAGENTA}Magenta${F_RESET}"
  echo -n "${C_CYAN} .... ";             echo -e "${C_CYAN}Cyan${F_RESET}"
  echo -n "${C_LIGHT_GRAY} .... ";       echo -e "${C_LIGHT_GRAY}Light gray${F_RESET}"
  echo -n "${C_DARK_GRAY} .... ";        echo -e "${C_DARK_GRAY}Dark gray${F_RESET}"
  echo -n "${C_LIGHT_RED} .... ";        echo -e "${C_LIGHT_RED}Light red${F_RESET}"
  echo -n "${C_LIGHT_GREEN} .... ";      echo -e "${C_LIGHT_GREEN}Light green${F_RESET}"
  echo -n "${C_LIGHT_YELLOW} .... ";     echo -e "${C_LIGHT_YELLOW}Light yellow${F_RESET}"
  echo -n "${C_LIGHT_BLUE} .... ";       echo -e "${C_LIGHT_BLUE}Light blue${F_RESET}"
  echo -n "${C_LIGHT_MAGENTA} .... ";    echo -e "${C_LIGHT_MAGENTA}Light magenta${F_RESET}"
  echo -n "${C_LIGHT_CYAN} .... ";       echo -e "${C_LIGHT_CYAN}Light cyan${F_RESET}"
  echo -n "${C_WHITE} .... ";            echo -e "${C_WHITE}White${F_RESET}"

  echo
  echo "Background colors"
  echo

  echo -n "${C_BG_DEFAULT} .... ";       echo -e "${C_BG_DEFAULT}Default${F_RESET}"
  echo -n "${C_BG_BLACK} .... ";         echo -e "${C_BG_BLACK}Black${F_RESET}"
  echo -n "${C_BG_RED} .... ";           echo -e "${C_BG_RED}Red${F_RESET}"
  echo -n "${C_BG_GREEN} .... ";         echo -e "${C_BG_GREEN}Green${F_RESET}"
  echo -n "${C_BG_YELLOW} .... ";        echo -e "${C_BG_YELLOW}Yellow${F_RESET}"
  echo -n "${C_BG_BLUE} .... ";          echo -e "${C_BG_BLUE}Blue${F_RESET}"
  echo -n "${C_BG_MAGENTA} .... ";       echo -e "${C_BG_MAGENTA}Magenta${F_RESET}"
  echo -n "${C_BG_CYAN} .... ";          echo -e "${C_BG_CYAN}Cyan${F_RESET}"
  echo -n "${C_BG_LIGHT_GRAY} .... ";    echo -e "${C_BG_LIGHT_GRAY}Light gray${F_RESET}"
  echo -n "${C_BG_DARK_GRAY} ... ";     echo -e "${C_BG_DARK_GRAY}Dark gray${F_RESET}"
  echo -n "${C_BG_LIGHT_RED} ... ";     echo -e "${C_BG_LIGHT_RED}Light red${F_RESET}"
  echo -n "${C_BG_LIGHT_GREEN} ... ";   echo -e "${C_BG_LIGHT_GREEN}Light green${F_RESET}"
  echo -n "${C_BG_LIGHT_YELLOW} ... ";  echo -e "${C_BG_LIGHT_YELLOW}Light yellow${F_RESET}"
  echo -n "${C_BG_LIGHT_BLUE} ... ";    echo -e "${C_BG_LIGHT_BLUE}Light blue${F_RESET}"
  echo -n "${C_BG_LIGHT_MAGENTA} ... "; echo -e "${C_BG_LIGHT_MAGENTA}Light magenta${F_RESET}"
  echo -n "${C_BG_LIGHT_CYAN} ... ";    echo -e "${C_BG_LIGHT_CYAN}Light cyan${F_RESET}"
  echo -n "${C_BG_WHITE} ... ";         echo -e "${C_BG_WHITE}White${F_RESET}"
}
