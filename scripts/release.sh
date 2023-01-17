#!/usr/bin/env bash

# Usage:
# $ . scripts/release.sh

files="README.adoc params/default/params.version.sh"

type gx &>/dev/null &&
	git release "${files}" ||
	printf "ERROR! For running this script, Git Xtended must be installed (see https://github.com/jprivet-dev/git-xtended).\n"

