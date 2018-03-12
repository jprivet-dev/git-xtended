#!/usr/bin/env bash

# TODO: create test
function gwb_git_config_get {
    git config --global $1
}

# TODO: create test
function gwb_git_config_set {
    git config --global $1 $2
}