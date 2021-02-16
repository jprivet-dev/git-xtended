#!/usr/bin/env bash
# shellcheck disable=SC2034  # Unused variables left for readability
:

_GX_HOOKS_PCMSG_REFERENCE_COLOR="${C_LIGHT_RED}"
_GX_HOOKS_PCMSG_TYPE_COLOR="${C_LIGHT_GREEN}"
_GX_HOOKS_PCMSG_SUBTYPE_COLOR="${C_LIGHT_YELLOW}"
_GX_HOOKS_PCMSG_MAINSCOPE_COLOR="${C_LIGHT_MAGENTA}"
_GX_HOOKS_PCMSG_SUBJECT_COLOR="${C_CYAN}"

_GX_HOOKS_PCMSG_TYPE_SHORTCUT_COLOR="${F_UNDERLINED}${C_LIGHT_GREEN}"
_GX_HOOKS_PCMSG_SUBTYPE_SHORTCUT_COLOR="${F_UNDERLINED}${C_LIGHT_YELLOW}"

_GX_HOOKS_PCMSG_REFERENCE_LABEL="${_GX_HOOKS_PCMSG_REFERENCE_COLOR}[#reference]${F_RESET}"
_GX_HOOKS_PCMSG_TYPE_LABEL="${_GX_HOOKS_PCMSG_TYPE_COLOR}<type*>${F_RESET}"
_GX_HOOKS_PCMSG_SUBTYPE_LABEL="${_GX_HOOKS_PCMSG_SUBTYPE_COLOR}<subtype>${F_RESET}"
_GX_HOOKS_PCMSG_MAINSCOPE_LABEL="${_GX_HOOKS_PCMSG_MAINSCOPE_COLOR}<scope*>${F_RESET}"
_GX_HOOKS_PCMSG_SUBJECT_LABEL="${_GX_HOOKS_PCMSG_SUBJECT_COLOR}<subject*>${F_RESET}"

#_GX_HOOKS_PCMSG_TYPES=(
#    'a/archi/Changes application architecture (folder position, name, ...)'
#    'c/conf/Changes configuration, parameters (config.yml, .gitignore, .gitkeep, ...)'
#    'co/content/Changes wording or images in contents'
#    'ch/chore/Changes to the build process or auxiliary tools and libraries (Gulp, Composer, ...)'
#    'd/dev/Changes main code (creation, enhancement, evolution, ...)'
#    'db/db/Changes related to data manipulation in databases (SQL, Oracle, Postgres, Cassandra, ...)'
#    'do/docs/Documentation only changes'
#    "i/integ/Web integration, UX works - doesn't touch business logic (css, js, ...)"
#    "in/install/Install or update project, modules, pluggins (ex: composer install ...)"
#    't/tpl/Templating works (Twig, Drupal templating, Smarty, ...)'
#    'tr/trans/Adds locale-specific components, translates text, ...'
#)
#
#_GX_HOOKS_PCMSG_SUBTYPES=(
#    'c/clean/Remove pointless code or files'
#    'd/debug/Adding code for debugging (console.log, dpm, var_dump, ...), to remove later!'
#    'f/fix/Bug fix'
#    'g/generate/Auto-generate code (Doctrine, PhoneGap, Ionic, ...)'
#    'p/perf/A code change that improves performance'
#    'r/refactor/A code change that neither fixes a bug nor adds a feature'
#    's/style/Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, ...)'
#)

_GX_HOOKS_PCMSG_TYPES=(
    "b|build|modification du système de build logiciel (composer.json, etc...)"
    "c|chore|modifications diverses du projet n'ayant pas d impact sur la production (.gitignore, modification des licences, etc)"
    "ci|ci|modification du système de CI"
    "d|doc|ajout/modification de la documentation"
    "f|feat|nouvelle fonctionnalité"
    "fi|fix|correctifs"
    "p|perf|amélioration des performances d'exécution"
    "r|refactor|refactoring de code"
    "s|style|amélioration UI/UX"
    "t|test|modification des fichiers de tests"
)

_GX_HOOKS_PCMSG_SUBTYPES=(
)
