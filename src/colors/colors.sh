#!/usr/bin/env bash

function gx_colors_print_all() {
  echo -n "${F_UNDERLINED} : ";       echo -e "Normal ${F_UNDERLINED}Underlined${F_RESET}"
  echo -n "${F_DIM} : ";              echo -e "Normal ${F_DIM}Dim${F_RESET}"0
  echo -n "${F_BOLD} : ";             echo -e "Normal ${F_BOLD}Bold${F_RESET}"
  echo -n "${F_INVERTED} : ";         echo -e "Normal ${F_INVERTED}Inverted${F_RESET}"
  echo -n "${F_HIDDEN} : ";           echo -e "Normal ${F_HIDDEN}Hidden${F_RESET}"

  echo

  echo -n "${C_DEFAULT} : ";          echo -e "Default ${C_DEFAULT}Default${F_RESET}"
  echo -n "${C_BLACK} : ";            echo -e "Default ${C_BLACK}Black${F_RESET}"
  echo -n "${C_RED} : ";              echo -e "Default ${C_RED}Red${F_RESET}"
  echo -n "${C_GREEN} : ";            echo -e "Default ${C_GREEN}Green${F_RESET}"
  echo -n "${C_YELLOW} : ";           echo -e "Default ${C_YELLOW}Yellow${F_RESET}"
  echo -n "${C_BLUE} : ";             echo -e "Default ${C_BLUE}Blue${F_RESET}"
  echo -n "${C_MAGENTA} : ";          echo -e "Default ${C_MAGENTA}Magenta${F_RESET}"
  echo -n "${C_CYAN} : ";             echo -e "Default ${C_CYAN}Cyan${F_RESET}"
  echo -n "${C_LIGHT_GRAY} : ";       echo -e "Default ${C_LIGHT_GRAY}Light gray${F_RESET}"
  echo -n "${C_DARK_GRAY} : ";        echo -e "Default ${C_DARK_GRAY}Dark gray${F_RESET}"
  echo -n "${C_LIGHT_RED} : ";        echo -e "Default ${C_LIGHT_RED}Light red${F_RESET}"
  echo -n "${C_LIGHT_GREEN} : ";      echo -e "Default ${C_LIGHT_GREEN}Light green${F_RESET}"
  echo -n "${C_LIGHT_YELLOW} : ";     echo -e "Default ${C_LIGHT_YELLOW}Light yellow${F_RESET}"
  echo -n "${C_LIGHT_BLUE} : ";       echo -e "Default ${C_LIGHT_BLUE}Light blue${F_RESET}"
  echo -n "${C_LIGHT_MAGENTA} : ";    echo -e "Default ${C_LIGHT_MAGENTA}Light magenta${F_RESET}"
  echo -n "${C_LIGHT_CYAN} : ";       echo -e "Default ${C_LIGHT_CYAN}Light cyan${F_RESET}"
  echo -n "${C_WHITE} : ";            echo -e "Default ${C_WHITE}White${F_RESET}"

  echo

  echo -n "${C_BG_DEFAULT} : ";       echo -e "Default ${C_BG_DEFAULT}Default${F_RESET}"
  echo -n "${C_BG_BLACK} : ";         echo -e "Default ${C_BG_BLACK}Black${F_RESET}"
  echo -n "${C_BG_RED} : ";           echo -e "Default ${C_BG_RED}Red${F_RESET}"
  echo -n "${C_BG_GREEN} : ";         echo -e "Default ${C_BG_GREEN}Green${F_RESET}"
  echo -n "${C_BG_YELLOW} : ";        echo -e "Default ${C_BG_YELLOW}Yellow${F_RESET}"
  echo -n "${C_BG_BLUE} : ";          echo -e "Default ${C_BG_BLUE}Blue${F_RESET}"
  echo -n "${C_BG_MAGENTA} : ";       echo -e "Default ${C_BG_MAGENTA}Magenta${F_RESET}"
  echo -n "${C_BG_CYAN} : ";          echo -e "Default ${C_BG_CYAN}Cyan${F_RESET}"
  echo -n "${C_BG_LIGHT_GRAY} : ";    echo -e "Default ${C_BG_LIGHT_GRAY}Light gray${F_RESET}"
  echo -n "${C_BG_DARK_GRAY} : ";     echo -e "Default ${C_BG_DARK_GRAY}Dark gray${F_RESET}"
  echo -n "${C_BG_LIGHT_RED} : ";     echo -e "Default ${C_BG_LIGHT_RED}Light red${F_RESET}"
  echo -n "${C_BG_LIGHT_GREEN} : ";   echo -e "Default ${C_BG_LIGHT_GREEN}Light green${F_RESET}"
  echo -n "${C_BG_LIGHT_YELLOW} : ";  echo -e "Default ${C_BG_LIGHT_YELLOW}Light yellow${F_RESET}"
  echo -n "${C_BG_LIGHT_BLUE} : ";    echo -e "Default ${C_BG_LIGHT_BLUE}Light blue${F_RESET}"
  echo -n "${C_BG_LIGHT_MAGENTA} : "; echo -e "Default ${C_BG_LIGHT_MAGENTA}Light magenta${F_RESET}"
  echo -n "${C_BG_LIGHT_CYAN} : ";    echo -e "Default ${C_BG_LIGHT_CYAN}Light cyan${F_RESET}"
  echo -n "${C_BG_WHITE} : ";         echo -e "Default ${C_BG_WHITE}White${F_RESET}"
}
