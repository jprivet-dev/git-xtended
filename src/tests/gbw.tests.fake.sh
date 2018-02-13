#!/usr/bin/env bash

GBW_USER="user"
function gbw_tests_fake_git_status_porcelain {
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
}

function gbw_tests_fake_git_branch {
    echo "  fake-branch-1"
    echo "  fake-branch-2"
    echo "* current-branch"
    echo "  develop"
    echo "  master"
}

function gbw_tests_fake_git {
    local args="$*"

    case $args in
        "status --porcelain")
            gbw_tests_fake_git_status_porcelain
        ;;
        "branch")
            gbw_tests_fake_git_branch
        ;;
    esac
}