#!/usr/bin/env bash
# shellcheck disable=SC2034  # Unused variables left for readability
:

_GX_HOOKS_PCMSG_REFERENCE_COLOR="${C_LIGHT_RED}"
_GX_HOOKS_PCMSG_TYPE_COLOR="${C_LIGHT_GREEN}"
_GX_HOOKS_PCMSG_SCOPE_COLOR="${C_LIGHT_MAGENTA}"
_GX_HOOKS_PCMSG_SUBJECT_COLOR="${C_CYAN}"

_GX_HOOKS_PCMSG_TYPE_SHORTCUT_COLOR="${F_UNDERLINED}${C_LIGHT_GREEN}"

_GX_HOOKS_PCMSG_TYPE_LABEL="${_GX_HOOKS_PCMSG_TYPE_COLOR}<type*>${F_RESET}"
_GX_HOOKS_PCMSG_SCOPE_LABEL="${_GX_HOOKS_PCMSG_SCOPE_COLOR}<scope*>${F_RESET}"
_GX_HOOKS_PCMSG_SUBJECT_LABEL="${_GX_HOOKS_PCMSG_SUBJECT_COLOR}<subject*>${F_RESET}"
_GX_HOOKS_PCMSG_REFERENCE_LABEL="${_GX_HOOKS_PCMSG_REFERENCE_COLOR}(#reference)${F_RESET}"

_GX_HOOKS_PCMSG_TYPES=(
    "b|build|Build system or external dependencies (Gulp, Broccoli, npm, ...)"
    "c|chore|Other changes that don't modify src or test files (.editorconfig, .gitignore, ...)"
    "ci|ci|CI configuration files and scripts (Travis, Circle, BrowserStack, ...)"
    "d|docs|Documentation only changes (CHANGELOG, README, ...)"
    "f|feat|A new feature"
    "fi|fix|A bug fix"
    "p|perf|A code change that improves performance"
    "r|refactor|Refactoring or code-cleanup (no functional changes, no API changes)"
    "s|style|Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, ...)"
    "t|test|Adding missing tests or correcting existing tests"
)
