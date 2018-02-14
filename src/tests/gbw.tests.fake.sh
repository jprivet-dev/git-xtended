#!/usr/bin/env bash

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

function gbw_tests_fake_git_diff_current_branch_origin_dev {
    echo " README.adoc                                  |   6 +-"
    echo " path/to/file-1                               |  18 +++++"
    echo " path/to/file-2                               |  13 ++++"
    echo " path/to/image-1                              | Bin 0 -> 7502 bytes"
    echo " 32 files changed, 755 insertions(+), 526 deletions(-)"
}

function gbw_tests_fake_git_revlist_current_remote {
    echo "88      0"
}

function gbw_tests_fake_git_revlist_remote_current {
    echo "0       88"
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
        "diff --stat origin/dev")
            gbw_tests_fake_git_diff_current_branch_origin_dev
        ;;
        "rev-list --left-right --count current-branch...remote-branch")
            gbw_tests_fake_git_revlist_current_remote
        ;;
        "rev-list --left-right --count remote-branch...current-branch")
            gbw_tests_fake_git_revlist_remote_current
        ;;
    esac
}