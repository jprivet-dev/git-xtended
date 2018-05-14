#!/usr/bin/env bash

function gx_hooks_pcmsg {
    local type_split="."
    local main_split=": "

    # --------------
    # TYPE

    declare -A types_index
    declare -A types_shortcut

    echo ""
    echo -e "${_GX_HOOKS_PCMSG_TYPE_LABEL} ="

    for key in "${!_GX_HOOKS_PCMSG_TYPES[@]}"; do
        if [[ ${_GX_HOOKS_PCMSG_TYPES[$key]} =~ ([^\/]*)\/([^\/]*)\/([^\/]*) ]]; then
            shorcut=${BASH_REMATCH[1]}
            type=${BASH_REMATCH[2]}
            info=${BASH_REMATCH[3]}

            types_shortcut[$shorcut]=$shorcut
            types_index[$shorcut]=$type

            text="   "
            text="${text} (${shorcut})"
            for (( i=${#shorcut}; i<=2; i++ )); do
                text="${text} "
            done

            text="${text} ${type}"
            for (( i=${#type}; i<=11; i++ )); do
                text="${text} "
            done

            text="${text} ${info}"

            echo "${text}"
        fi
    done

    # --------------
    # SUBTYPE

    declare -A subtypes_shortcut
    declare -A subtypes_index

    echo ""
    echo -e "${_GX_HOOKS_PCMSG_SUBTYPE_LABEL} ="

    for key in "${!_GX_HOOKS_PCMSG_SUBTYPES[@]}"; do
        if [[ ${_GX_HOOKS_PCMSG_SUBTYPES[$key]} =~ ([^\/]*)\/([^\/]*)\/([^\/]*) ]]; then
            shorcut=${BASH_REMATCH[1]}
            subtype=${BASH_REMATCH[2]}
            info=${BASH_REMATCH[3]}

            subtypes_shortcut[$shorcut]=$shorcut
            subtypes_index[$shorcut]=$subtype

            text="   "
            text="${text} (${shorcut})"
            for (( i=${#shorcut}; i<=2; i++ )); do
                text="${text} "
            done

            text="${text} ${subtype}"
            for (( i=${#subtype}; i<=11; i++ )); do
                text="${text} "
            done

            text="${text} ${info}"

            echo "${text}"
        fi
    done

    # --------------
    # Example

    echo ""
    echo -e "MSG = ${_GX_HOOKS_PCMSG_TYPE_LABEL}${type_split}${_GX_HOOKS_PCMSG_SUBTYPE_LABEL}(${_GX_HOOKS_PCMSG_MAINSCOPE_LABEL})${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL}"
    echo ""

    # --------------
    # Type & Subtype

    while true; do
        echo -e -n "${_GX_HOOKS_PCMSG_TYPE_LABEL}.${_GX_HOOKS_PCMSG_SUBTYPE_LABEL} : "

        exec < /dev/tty
        read choise_type_subtype_index

        choise_type_subtype_index_tab=(${choise_type_subtype_index})
        choise_type_index="${choise_type_subtype_index_tab[0]}"
        choise_subtype_index="${choise_type_subtype_index_tab[1]}"

        choise_type_index_valid=0
        choise_subtype_index_valid=0

        [[ " ${types_shortcut[@]} " =~ " ${choise_type_index} " ]]

        if [ "${BASH_REMATCH}" != "" ]; then
            choise_type_index_valid=1;
        fi

        if [ "${choise_subtype_index}" == "" ] ;then
            choise_subtype_index_valid=1
        else
            [[ " ${subtypes_shortcut[@]} " =~ " ${choise_subtype_index} " ]]

            if [ "${BASH_REMATCH}" != "" ]; then
                choise_subtype_index_valid=1
            fi
        fi

        if [ "${choise_type_index_valid}" == 1 -a "${choise_subtype_index_valid}" == 1 ]; then
            break;
        fi
    done

    # --------------
    # Type

    type=${types_index[$choise_type_index]}

    # --------------
    # Subtype

    subtype=""
    if [ "${choise_subtype_index}" != "" ] ;then
        subtype=${subtypes_index[$choise_subtype_index]}
    fi

    # --------------
    # Type split

    if [ "${type}" == "" -o "${subtype}" == "" ]; then
        type_split=""
    fi

    # --------------
    # File ref

    files_listing=$(gx_git_status_get_filenames_inline)

    while true; do
        echo -e -n "${type}${type_split}${subtype}(${_GX_HOOKS_PCMSG_MAINSCOPE_LABEL}) : [${files_listing}] "

        exec < /dev/tty
        read mainscope_choose

        if [ "${files_listing}" != "" -o "${mainscope_choose}" != "" ]; then
            break;
        fi
    done

    mainscope="${files_listing}"
    if [ "${mainscope_choose}" != "" ] ;then
        mainscope="${mainscope_choose}"
    fi

    # --------------
    # Scope

    # --------------
    # Commit message

    while true; do
        echo -e -n "${type}${type_split}${subtype}(${mainscope})${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL} "

        exec < /dev/tty
        read subject

        if [ "${subject}" != "" ]; then
            break;
        fi
    done

    # --------------
    # Final message

    complete_message="${type}${type_split}${subtype}(${mainscope})${main_split}${subject}"

    if [ "${message}" != "no" ]; then
        echo ""
        echo "${complete_message}" > "${COMMIT_MSG}"
    else
        echo -e "${C_BG_LIGHT_RED} commit aborted ${F_RESET}"
        exit 1
    fi
}