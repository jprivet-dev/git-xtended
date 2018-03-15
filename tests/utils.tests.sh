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
    assert equals "$(gbw_implode " $_RED-$_RESET " "con" "ca" "te" "na" "te")"          "con \e[31m-\e[0m ca \e[31m-\e[0m te \e[31m-\e[0m na \e[31m-\e[0m te" $LINENO

    local email_part_1="address"
    local email_part_2="email.com"
    assert equals "$(gbw_implode "@" "$email_part_1" "$email_part_2")" "address@email.com" $LINENO
    assert equals "$(gbw_implode "@" "" "$email_part_2")" "email.com" $LINENO
    assert equals "$(gbw_implode "@" "$email_part_1" "")" "address" $LINENO
}

function test_gbw_echo_fixed_width {
    assert equals "$(gbw_echo_fixed_width 12 "-" "abcd" "4321")"        "abcd----4321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 "-" "abcdef" "21")"        "abcdef----21" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 "-" "ab" "654321")"        "ab----654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 "-" "abcdef" "654321")"    "abcdef654321" $LINENO
    assert equals "$(gbw_echo_fixed_width 12 "-" "a" "1")"              "a----------1" $LINENO
}