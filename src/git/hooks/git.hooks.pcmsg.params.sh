#!/usr/bin/env bash

_GX_HOOKS_PCMSG_TYPE_LABEL="${C_LIGHT_GREEN}<type*>${F_RESET}"
_GX_HOOKS_PCMSG_SUBTYPE_LABEL="${C_LIGHT_YELLOW}<subtype>${F_RESET}"
_GX_HOOKS_PCMSG_MAINSCOPE_LABEL="${C_LIGHT_MAGENTA}<scope*>${F_RESET}"
_GX_HOOKS_PCMSG_SUBJECT_LABEL="${C_LIGHT_RED}<subject*>${F_RESET}"

_GX_HOOKS_PCMSG_TYPES=(
    'a/archi/Changes application architecture (folder position, name, ...)'
    'c/conf/Changes configuration, parameters (config.yml, .gitignore, .gitkeep, ...)'
    'co/content/Changes wording or images in contents'
    'ch/chore/Changes to the build process or auxiliary tools and libraries (Gulp, Composer, ...)'
    'd/dev/Changes main code (creation, enhancement, evolution, ...)'
    'do/docs/Documentation only changes'
    "i/integ/Web integration, UX works - doesn't touch business logic (css, js, ...)"
    "in/install/Install or update project, modules, pluggins (ex: composer install ...)"
    't/tpl/Templating works (Twig, Drupal templating, Smarty, ...)'
    'tr/trans/Adds locale-specific components, translates text, ...'
)

_GX_HOOKS_PCMSG_SUBTYPES=(
    'c/clean/Remove pointless code or files'
    'd/debug/Adding code for debugging (console.log, dpm, var_dump, ...), to remove later !'
    'f/fix/Bug fix'
    'g/generate/Auto-generate code (Doctrine, PhoneGap, Ionic, ...)'
    'p/perf/A code change that improves performance'
    'r/refactor/A code change that neither fixes a bug nor adds a feature'
    's/style/Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, ...)'
)

