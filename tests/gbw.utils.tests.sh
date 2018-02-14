#!/usr/bin/env bash

function test_gbw_implode {
    assert equals "$(gbw_implode " " "con" "ca" "te" "na" "te")" "con ca te na te" $LINENO
    assert equals "$(gbw_implode "  " "con" "ca" "te" "na" "te")" "con  ca  te  na  te" $LINENO
    assert equals "$(gbw_implode "-" "con" "ca" "te" "na" "te")" "con-ca-te-na-te" $LINENO
    assert equals "$(gbw_implode " - " "con" "ca" "te" "na" "te")" "con - ca - te - na - te" $LINENO

    local email_part_1="address"
    local email_part_2="email.com"
    assert equals "$(gbw_implode "@" "$email_part_1" "$email_part_2")" "address@email.com" $LINENO
}