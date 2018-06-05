#!/usr/bin/env bash

function gx_test_fake_git_status_porcelain {
    echo "M  changes/to/be/committed/modified"
    echo "A  changes/to/be/committed/added"
    echo "D  changes/to/be/committed/deleted"
    echo "R  old/filename -> changes/to/be/committed/renamed"
    echo "C  changes/to/be/committed/copied"
    echo " M changes/not/staged/for/commit/modified"
    echo " A changes/not/staged/for/commit/added"
    echo " D changes/not/staged/for/commit/deleted"
    echo " R changes/not/staged/for/commit/renamed"
    echo " C changes/not/staged/for/commit/copied"
    echo "?? untracked/files"
}

function gx_test_fake_git_branch {
    echo "  fake-branch-1"
    echo "  fake-branch-2"
    echo "* ${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}"
    echo "  develop"
    echo "  master"
}

function gx_test_fake_git_rev_parse_abbrev_ref_head {
    echo "${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}"
}

function gx_test_fake_git_diff_current_branch_origin_dev {
    echo " README.adoc                                  |   6 +-"
    echo " path/to/file-1                               |  18 +++++"
    echo " path/to/file-2                               |  13 ++++"
    echo " path/to/image-1                              | Bin 0 -> 7502 bytes"
    echo " 32 files changed, 755 insertions(+), 526 deletions(-)"
}

function gx_test_fake_git_revlist_current_remote {
    echo "88      0"
}

function gx_test_fake_git_revlist_remote_current {
    echo "10       32"
}

function gx_test_fake_git_revlist_current_remote_nok {
    echo ""
}

function gx_test_fake_git_rev_parse_git_dir {
    echo ".git"
}

function gx_test_fake_git_get_current_username {
    echo "current-username"
}

function gx_test_fake_git_get_remote_branch_ref {
    echo "remote-branch"
}

function gx_test_fake_git_last_args_set {
    echo "$*" > /tmp/gx_test_fake_git_last_args.sh
}

function gx_test_fake_git_last_args_check {
    local value=$(< /tmp/gx_test_fake_git_last_args.sh)
    gx_test_fake_git_last_args_set ""
    echo "${value}"
}

function gx_test_fake_git_last_args_get {
    echo $(< /tmp/gx_test_fake_git_last_args.sh)
}

function gx_test_fake_git {
    local args="$*"

    gx_test_fake_git_last_args_set "git $*"

    case $args in
        "status --porcelain")
            gx_test_fake_git_status_porcelain
        ;;
        "branch")
            gx_test_fake_git_branch
        ;;
        "rev-parse --abbrev-ref HEAD")
            gx_test_fake_git_rev_parse_abbrev_ref_head
        ;;
        "diff --stat ${TEST_GX_PARAMS_FAKE_GIT_GET_REMOTE_BRANCH_REF}")
            gx_test_fake_git_diff_current_branch_origin_dev
        ;;
        "rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}...${TEST_GX_PARAMS_FAKE_GIT_GET_REMOTE_BRANCH_REF}")
            gx_test_fake_git_revlist_current_remote
        ;;
        "rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_GIT_GET_REMOTE_BRANCH_REF}...${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}")
            gx_test_fake_git_revlist_remote_current
        ;;
        "rev-list --left-right --count ${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}...wrong-remote-branch")
            gx_test_fake_git_revlist_current_remote_nok
        ;;
        "rev-list --left-right --count wrong-remote-branch...${TEST_GX_PARAMS_FAKE_GIT_GET_CURRENT_BRANCH}")
            gx_test_fake_git_revlist_remote_current_nok
        ;;
        "rev-parse --git-dir")
            gx_test_fake_git_rev_parse_git_dir
        ;;
        "config user.name")
            gx_test_fake_git_get_current_username
        ;;
        "config gx.remote_branch_ref")
            gx_test_fake_git_get_remote_branch_ref
        ;;
        "--version")
            return
        ;;
        config*)
            return
        ;;
        *)
            echo "[ ERROR !!! No Git fake command for 'git ${args}' ]"
        ;;
    esac
}