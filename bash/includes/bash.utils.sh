#!/usr/bin/env bash

function gbw_implode {
    local glue="$1"
    shift
    echo "$*"
}