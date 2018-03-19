#!/usr/bin/env bash

function test_gbw_implode {
    local _RED="\e[31m"
    local _RESET="\e[0m"

    assert equals "$(gbw_implode "-" "con" "ca" "te" "na" "te")"                                "con-ca-te-na-te" $LINENO
    assert equals "$(gbw_implode "-"   "con"  "ca"  "te"      "na"  "te")"                      "con-ca-te-na-te" $LINENO
    assert equals "$(gbw_implode "-"   "con"  "ca"  "te"   ""   "na" "" "te")"                  "con-ca-te-na-te" $LINENO
    assert equals "$(gbw_implode "-"   "con"  "ca"  "te"   " "   "na"  "   "   "te")"           "con-ca-te-na-te" $LINENO

    assert equals "$(gbw_implode " " "con" "ca" "te" "na" "te")"                                "con ca te na te" $LINENO
    assert equals "$(gbw_implode " "   "con"  "ca"  "te"      "na"  "te")"                      "con ca te na te" $LINENO
    assert equals "$(gbw_implode " "   "con"  "ca"  "te"   ""   "na" "" "te")"                  "con ca te na te" $LINENO
    assert equals "$(gbw_implode " "   "con"  "ca"  "te"   ""   ""   "na" "" "te")"             "con ca te na te" $LINENO
    assert equals "$(gbw_implode " "   "con"  "ca"  "te"   " "   " "   "na"  "   "   "te")"     "con ca te na te" $LINENO

    assert equals "$(gbw_implode "  " "con" "ca" "te" "na" "te")"                               "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   "con"  "ca"  "te"      "na"  "te")"                     "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   "con"  "ca"  "te"   ""   ""   "na" "" "te")"            "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   "con"  "ca"  "te"   " "   " "   "na"  "   "   "te")"    "con  ca  te  na  te" $LINENO

    assert equals "$(gbw_implode "  " \"con\" \"ca\" \"te\" \"na\" \"te\")"                                     "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   \"con\"  \"ca\"  \"te\"      \"na\"  \"te\")"                           "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   \"con\"  \"ca\"  \"te\"   \"\"   \"\"   \"na\" \"\" \"te\")"            "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "  "   \"con\"  \"ca\"  \"te\"   \" \"   \" \"   \"na\"  \"   \"   \"te\")"    "con  ca  te  na  te" $LINENO

    assert equals "$(gbw_implode " - " "con" "ca" "te" "na" "te")"                      "con - ca - te - na - te" $LINENO
    assert equals "$(gbw_implode " \e[31m-\e[0m " "con" "ca" "te" "na" "te")"           "con \e[31m-\e[0m ca \e[31m-\e[0m te \e[31m-\e[0m na \e[31m-\e[0m te" $LINENO
    assert equals "$(gbw_implode " ${_RED}-${_RESET} " "con" "ca" "te" "na" "te")"          "con \e[31m-\e[0m ca \e[31m-\e[0m te \e[31m-\e[0m na \e[31m-\e[0m te" $LINENO

    local email_part_1="address"
    local email_part_2="email.com"
    assert equals "$(gbw_implode "@" "${email_part_1}" "${email_part_2}")" "address@email.com" $LINENO
    assert equals "$(gbw_implode "@" "" "${email_part_2}")" "email.com" $LINENO
    assert equals "$(gbw_implode "@" "${email_part_1}" "")" "address" $LINENO
}

function test_gbw_echo_fixed_width {
    assert equals "$(gbw_echo_fixed_width 12 . "abcd" "4321")"              "abcd....4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdef" "21")"              "abcdef....21" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "ab" "654321")"              "ab....654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdef" "654321")"          "abcdef654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "a" "1")"                    "a..........1" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "a" "")"                     "a..........." $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "" "1")"                     "...........1" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 .)"                            "............" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdefgh" "89654321")"      "abcdefgh89654321" $LINENO

    assert equals "$(gbw_echo_fixed_width 8 . "abcd" "4321")"               "abcd4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 9 . "abcd" "4321")"               "abcd.4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 16 . "abcd" "4321")"              "abcd........4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 16 . "4321" "abcd")"              "4321........abcd" $LINENO

    assert equals "$(gbw_echo_fixed_width 20 . "ab cd" "43 21")"                    "ab cd..........43 21" $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . "ab cd ef" "21")"                    "ab cd ef..........21" $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . "ab" "65 43 21")"                    "ab..........65 43 21" $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . "ab cd ef" "65 43 21")"              "ab cd ef....65 43 21" $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . " a " " 1 ")"                        " a .............. 1 " $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . " a " "")"                           " a ................." $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . "" " 1 ")"                           "................. 1 " $LINENO
    assert equals "$(gbw_echo_fixed_width 20 .)"                                    "...................." $LINENO
    assert equals "$(gbw_echo_fixed_width 20 . " ab cd ef gh" "89 65 43 21 ")"      " ab cd ef gh89 65 43 21 " $LINENO

    assert equals "$(gbw_echo_fixed_width 12 . "abcd" "4321" " " " ")"              "abcd .. 4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdef" "21" " " " ")"              "abcdef .. 21" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "ab" "654321" " " " ")"              "ab .. 654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdef" "654321" " " " ")"          "abcdef  654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "a" "1" " " " ")"                    "a ........ 1" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "a" "" " " " ")"                     "a ......... " $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "" "1" " " " ")"                     " ......... 1" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "" "" " " " ")"                      " .......... " $LINENO
    assert equals "$(gbw_echo_fixed_width 12 . "abcdefgh" "89654321" " " " ")"      "abcdefgh  89654321" $LINENO
}

function test_gbw_trim {
    assert equals "$(gbw_trim "abc")"   "abc" $LINENO
    assert equals "$(gbw_trim "abc ")"  "abc" $LINENO
    assert equals "$(gbw_trim " abc")"  "abc" $LINENO
    assert equals "$(gbw_trim " abc ")" "abc" $LINENO

    assert equals "$(gbw_trim "abc 123")"       "abc 123" $LINENO
    assert equals "$(gbw_trim "abc 123 ")"      "abc 123" $LINENO
    assert equals "$(gbw_trim " abc 123")"      "abc 123" $LINENO
    assert equals "$(gbw_trim " abc 123 ")"     "abc 123" $LINENO
}

function test_gbw_regex_remove_colors {
    local _F_BOLD="\e[1m"
    local _F_RESET="\e[0m"
    local _C_RED="\e[31m"
    local _C_WHITE="\e[97m"
    local _C_BG_CYAN="\e[46m"
    local _C_BG_LIGHT_MAGENTA="\e[100m"

    assert equals "$(gbw_regex_remove_colors "color")"   "color" $LINENO

    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}color")"                "color" $LINENO
    assert equals "$(gbw_regex_remove_colors "color${_F_RESET}")"               "color" $LINENO
    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}color${_F_RESET}")"     "color" $LINENO

    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}color outrenoir")"                  "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "color outrenoir${_F_RESET}")"                 "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}color outrenoir${_F_RESET}")"       "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}color${_F_RESET} outrenoir")"       "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "color ${_F_BOLD}outrenoir${_F_RESET}")"       "color outrenoir" $LINENO

    assert equals "$(gbw_regex_remove_colors "color${_C_RED}outrenoir")"                    "coloroutrenoir" $LINENO

    assert equals "$(gbw_regex_remove_colors "${_F_BOLD}${_F_RESET}${_C_RED}${_C_WHITE}${_C_BG_CYAN}${_C_BG_LIGHT_MAGENTA}")" "" $LINENO

    assert equals "$(gbw_regex_remove_colors "\e${_C_RED}\e")"  "\e\e" $LINENO
    assert equals "$(gbw_regex_remove_colors "m${_C_RED}m")"    "mm" $LINENO
    assert equals "$(gbw_regex_remove_colors "\e${_C_RED}m")"   "\em" $LINENO
    assert equals "$(gbw_regex_remove_colors "\e[${_C_RED}")"   "\e[" $LINENO

    assert equals "$(gbw_regex_remove_colors "\e[1234m")"       "\e[1234m" $LINENO
}

function test_gbw_line_generator {
    assert equals "$(gbw_line_generator 0 ".")"     "" $LINENO

    assert equals "$(gbw_line_generator 5 ".")"     "....." $LINENO
    assert equals "$(gbw_line_generator 10 ".")"    ".........." $LINENO

    assert equals "$(gbw_line_generator 5 "a")"     "aaaaa" $LINENO
    assert equals "$(gbw_line_generator 10 "a")"    "aaaaaaaaaa" $LINENO

    assert equals "$(gbw_line_generator 5 "-0-")"   "-0--0--0--0--0-" $LINENO
    assert equals "$(gbw_line_generator 5 "| ")"    "| | | | | " $LINENO
}