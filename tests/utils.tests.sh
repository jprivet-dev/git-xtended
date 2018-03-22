#!/usr/bin/env bash

function test_gbw_implode {
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

    assert equals "$(gbw_implode " - " "con" "ca" "te" "na" "te")"                          "con - ca - te - na - te" $LINENO
    assert equals "$(gbw_implode " ${C_RED}-${F_RESET} " "con" "ca" "te" "na" "te")"        "con ${TEST_C_RED}-${TEST_F_RESET} ca ${TEST_C_RED}-${TEST_F_RESET} te ${TEST_C_RED}-${TEST_F_RESET} na ${TEST_C_RED}-${TEST_F_RESET} te" $LINENO
    assert equals "$(gbw_implode " ${C_RED}-${F_RESET} " "con" "ca" "te" "na" "te")"        "con ${TEST_C_RED}-${TEST_F_RESET} ca ${TEST_C_RED}-${TEST_F_RESET} te ${TEST_C_RED}-${TEST_F_RESET} na ${TEST_C_RED}-${TEST_F_RESET} te" $LINENO

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
    assert equals "$(gbw_regex_remove_colors "color")"   "color" $LINENO

    assert equals "$(gbw_regex_remove_colors "${F_BOLD}color")"                "color" $LINENO
    assert equals "$(gbw_regex_remove_colors "color${F_RESET}")"               "color" $LINENO
    assert equals "$(gbw_regex_remove_colors "${F_BOLD}color${F_RESET}")"     "color" $LINENO

    assert equals "$(gbw_regex_remove_colors "${F_BOLD}color outrenoir")"                  "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "color outrenoir${F_RESET}")"                 "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "${F_BOLD}color outrenoir${F_RESET}")"       "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "${F_BOLD}color${F_RESET} outrenoir")"       "color outrenoir" $LINENO
    assert equals "$(gbw_regex_remove_colors "color ${F_BOLD}outrenoir${F_RESET}")"       "color outrenoir" $LINENO

    assert equals "$(gbw_regex_remove_colors "color${C_RED}outrenoir")"                    "coloroutrenoir" $LINENO

    assert equals "$(gbw_regex_remove_colors "${F_BOLD}${F_RESET}${C_RED}${C_WHITE}${C_BG_CYAN}${C_BG_LIGHT_MAGENTA}")" "" $LINENO

    assert equals "$(gbw_regex_remove_colors "\e${C_RED}\e")"  "\e\e" $LINENO
    assert equals "$(gbw_regex_remove_colors "m${C_RED}m")"    "mm" $LINENO
    assert equals "$(gbw_regex_remove_colors "\e${C_RED}m")"   "\em" $LINENO
    assert equals "$(gbw_regex_remove_colors "\e[${C_RED}")"   "\e[" $LINENO

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

function test_gbw_print {
    assert equals "$(gbw_print hello)"                  "hello" $LINENO
    assert equals "$(gbw_print hello 42)"               "hello 42" $LINENO

    assert equals "$(gbw_print "hello")"                "hello" $LINENO
    assert equals "$(gbw_print "hello 42")"             "hello 42" $LINENO

    assert equals "$(gbw_print "    hello")"            "    hello" $LINENO
    assert equals "$(gbw_print "    hello 42")"         "    hello 42" $LINENO
}

function test_gbw_print_colors {
    assert equals "$(gbw_print ${F_BOLD}hello${F_RESET})"               "${TEST_F_BOLD}hello${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_print ${F_BOLD}hello 42${F_RESET})"            "${TEST_F_BOLD}hello 42${TEST_F_RESET}" $LINENO

    assert equals "$(gbw_print "${F_BOLD}hello${F_RESET}")"             "${TEST_F_BOLD}hello${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_print "${F_BOLD}hello 42${F_RESET}")"          "${TEST_F_BOLD}hello 42${TEST_F_RESET}" $LINENO

    assert equals "$(gbw_print "    ${F_BOLD}hello${F_RESET}")"         "    ${TEST_F_BOLD}hello${TEST_F_RESET}" $LINENO
    assert equals "$(gbw_print "    ${F_BOLD}hello 42${F_RESET}")"      "    ${TEST_F_BOLD}hello 42${TEST_F_RESET}" $LINENO
}