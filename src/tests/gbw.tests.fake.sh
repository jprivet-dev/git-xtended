#!/usr/bin/env bash

GBW_USER="user"

function gbw_tests_fake_git {
    local args="$*"
    case $args in
        "status --porcelaine")
            echo "M  changes-to-be-committed--modified"
            echo "A  changes-to-be-committed--added"
            echo "D  changes-to-be-committed--deleted"
            echo "R  changes-to-be-committed--renamed"
            echo "C  changes-to-be-committed--copied"

            echo " M changes-not-staged-for-commit--modified"
            echo " A changes-not-staged-for-commit--added"
            echo " D changes-not-staged-for-commit--deleted"
            echo " R changes-not-staged-for-commit--renamed"
            echo " C changes-not-staged-for-commit--copied"

            echo "?? untracked-files"
        ;;
    esac
}