#!/usr/bin/env bash

function gx_hooks_pcmsg() {
    local split="--------------------------------------------------"

    local commit_msg=$1
    local commit_mode=$2

    local last_reference
    local last_type_index
    local last_subtype_index

    local reference
    local type
    local subtype
    local scope
    local subject
    local step=0

    local type_subtype_default
    local subject_default

    local trigger_by_hook=0

    if [[ ".git/COMMIT_EDITMSG" == "${commit_msg}" ]]; then
        trigger_by_hook=1
    else
        type_subtype_default="$1"
        shift
        subject_default="$@"
    fi

    local reference_split=" "
    local type_split="."
    local main_split=": "

    # --------------
    # TYPE

    declare -A types_index
    declare -A types_shortcut

    echo "user.name  : $(git config user.name)"
    echo "user.email : $(git config user.email)"
    printf "%s\n" "${split}"

    echo -e "MSG = ${_GX_HOOKS_PCMSG_REFERENCE_LABEL}${reference_split}${_GX_HOOKS_PCMSG_TYPE_LABEL}${type_split}${_GX_HOOKS_PCMSG_SUBTYPE_LABEL}(${_GX_HOOKS_PCMSG_MAINSCOPE_LABEL})${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL}"
    printf "%s\n" "${split}"

    echo ""
    echo -e "${_GX_HOOKS_PCMSG_TYPE_LABEL}"

    for key in "${!_GX_HOOKS_PCMSG_TYPES[@]}"; do
        if [[ ${_GX_HOOKS_PCMSG_TYPES[$key]} =~ ([^\/]*)\/([^\/]*)\/([^\/]*) ]]; then
            shorcut=${BASH_REMATCH[1]}
            type=${BASH_REMATCH[2]}
            info=${BASH_REMATCH[3]}

            types_index[$shorcut]=$type
            types_shortcut[$shorcut]=$shorcut

            gx_hooks_pcmsg_print_type "${_GX_HOOKS_PCMSG_TYPE_SHORTCUT_COLOR}" "${type}" "${shorcut}" "${info}"
        fi
    done

    # --------------
    # SUBTYPE

    declare -A subtypes_shortcut
    declare -A subtypes_index

    echo ""
    echo -e "${_GX_HOOKS_PCMSG_SUBTYPE_LABEL}"

    for key in "${!_GX_HOOKS_PCMSG_SUBTYPES[@]}"; do
        if [[ ${_GX_HOOKS_PCMSG_SUBTYPES[$key]} =~ ([^\/]*)\/([^\/]*)\/([^\/]*) ]]; then
            shorcut=${BASH_REMATCH[1]}
            subtype=${BASH_REMATCH[2]}
            info=${BASH_REMATCH[3]}

            subtypes_index[$shorcut]=$subtype
            subtypes_shortcut[$shorcut]=$shorcut

            gx_hooks_pcmsg_print_type "${_GX_HOOKS_PCMSG_SUBTYPE_SHORTCUT_COLOR}" "${subtype}" "${shorcut}" "${info}"
        fi
    done

    printf "\n%s\n" "${split}"
    echo "" # tricks : with tput cuu1 and el, thath avoid new line with first ENTER action

    while true; do
        case $step in
        0)
            gx_hooks_pcmsg_reference
            ;;
        1)
            gx_hooks_pcmsg_type_subtype
            ;;
        2)
            gx_hooks_pcmsg_type_mainscope
            ;;
        3)
            gx_hooks_pcmsg_type_subject
            ;;
        4)
            gx_hooks_pcmsg_type_final_message
            ;;
        *)
            break
            ;;
        esac
    done
}

function gx_hooks_pcmsg_reference() {
    local last_reference_prompt=""
    last_reference=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}")

    if [ "${last_reference}" != "" ]; then
        last_reference_prompt="[#${last_reference}]* "
    fi

    while true; do
        tput cuu1
        tput el
        echo -e -n "${_GX_HOOKS_PCMSG_REFERENCE_LABEL} ${C_DARK_GRAY}<<<${F_RESET} ${last_reference_prompt}"

        exec </dev/tty
        read reference_choose

        break
    done

    reference=""

    if [ "${reference_choose}" == "*" ]; then
        reference_choose=""
        last_reference=""
    fi

    if [ "${reference_choose}" == "" ]; then
        if [ "${last_reference}" != "" ]; then
            reference="[#${last_reference}]${reference_split}"
        fi
    else
        reference="[#${reference_choose}]${reference_split}"
        $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}" "${reference_choose}")
    fi

    if [ "${reference}" == "" ]; then
        gx_hooks_pcmsg_git_config_local_remove "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}"
    fi

    gx_hooks_pcmsg_next_step
}

function gx_hooks_pcmsg_type_subtype() {
    local gx_git_get_commit_last_suggest=""

    last_type_index=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_TYPE_INDEX}")
    last_subtype_index=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SUBTYPE_INDEX}")

    if [ "${last_type_index}" != "" ]; then
        if [ "${last_subtype_index}" != "" ]; then
            gx_git_get_commit_last_suggest=" [${types_index[$last_type_index]}${type_split}${subtypes_index[$last_subtype_index]}]"
        else
            gx_git_get_commit_last_suggest=" [${types_index[$last_type_index]}]"
        fi
    else
        gx_git_get_commit_last_suggest=""
    fi

    type=""
    subtype=""

    while true; do
        tput cuu1
        tput el
        echo -e -n "${reference}${_GX_HOOKS_PCMSG_TYPE_LABEL}.${_GX_HOOKS_PCMSG_SUBTYPE_LABEL} ${C_DARK_GRAY}<<<${F_RESET}${gx_git_get_commit_last_suggest} "

        exec </dev/tty
        read choise_type_subtype_index

        if [ "${choise_type_subtype_index}" == "*" ]; then
            break
        fi

        if [ "${choise_type_subtype_index}" == "" ]; then
            choise_type_index="${last_type_index}"
            choise_subtype_index="${last_subtype_index}"
        else
            choise_type_subtype_index_tab=(${choise_type_subtype_index})
            choise_type_index="${choise_type_subtype_index_tab[0]}"
            choise_subtype_index="${choise_type_subtype_index_tab[1]}"
        fi

        choise_type_index_valid=0
        choise_subtype_index_valid=0

        [[ " ${types_shortcut[@]} " =~ " ${choise_type_index} " ]]

        if [ "${BASH_REMATCH}" != "" ]; then
            choise_type_index_valid=1
        fi

        if [ "${choise_subtype_index}" == "" ]; then
            choise_subtype_index_valid=1
        else
            [[ " ${subtypes_shortcut[@]} " =~ " ${choise_subtype_index} " ]]

            if [ "${BASH_REMATCH}" != "" ]; then
                choise_subtype_index_valid=1
            fi
        fi

        if [ "${choise_type_index_valid}" == 1 -a "${choise_subtype_index_valid}" == 1 ]; then
            $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_TYPE_INDEX}" "${choise_type_index}")

            if [ "${choise_subtype_index}" == "" ]; then
                $(gx_hooks_pcmsg_git_config_local_remove "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SUBTYPE_INDEX}")
            else
                $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SUBTYPE_INDEX}" "${choise_subtype_index}")
            fi

            break
        fi
    done

    if [ "${choise_type_subtype_index}" == "*" ]; then
        gx_hooks_pcmsg_previous_step
    else
        # --------------
        # Type

        type=${types_index[$choise_type_index]}

        # --------------
        # Subtype

        subtype=""
        if [ "${choise_subtype_index}" != "" ]; then
            subtype=${subtypes_index[$choise_subtype_index]}
        fi

        # --------------
        # Type split

        if [ "${type}" == "" -o "${subtype}" == "" ]; then
            final_type_split=""
        else
            final_type_split="${type_split}"
        fi

        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_type_mainscope() {
    files_listing=$(gx_git_status_get_filenames_inline)

    while true; do
        tput cuu1
        tput el
        echo -e -n "${reference}${type}${final_type_split}${subtype}(${_GX_HOOKS_PCMSG_MAINSCOPE_LABEL}) ${C_DARK_GRAY}<<<${F_RESET} [${files_listing}] "

        exec </dev/tty
        read mainscope_choose

        if [ "${mainscope_choose}" == "*" ]; then
            break
        fi

        if [ "${files_listing}" != "" -o "${mainscope_choose}" != "" ]; then
            break
        fi
    done

    if [ "${mainscope_choose}" == "*" ]; then
        gx_hooks_pcmsg_previous_step
    else

        mainscope="${files_listing}"
        if [ "${mainscope_choose}" != "" ]; then
            mainscope="${mainscope_choose}"
        fi

        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_type_subject() {
    while true; do
        tput cuu1
        tput el
        echo -e -n "${reference}${type}${final_type_split}${subtype}(${mainscope})${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL} ${C_DARK_GRAY}<<<${F_RESET} "

        exec </dev/tty
        read subject

        if [ "${subject}" == "*" ]; then
            break
        fi

        if [ "${subject}" != "" ]; then
            break
        fi
    done

    if [ "${subject}" == "*" ]; then
        gx_hooks_pcmsg_previous_step
    else
        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_type_final_message() {
    complete_message="${reference}${type}${final_type_split}${subtype}(${mainscope})${main_split}${subject}"

    local reference_colors="${_GX_HOOKS_PCMSG_REFERENCE_COLOR}${reference}${F_RESET}"
    local type_colors="${_GX_HOOKS_PCMSG_TYPE_COLOR}${type}${F_RESET}"
    local subtype_colors="${_GX_HOOKS_PCMSG_SUBTYPE_COLOR}${subtype}${F_RESET}"
    local mainscope_colors="${_GX_HOOKS_PCMSG_MAINSCOPE_COLOR}${mainscope}${F_RESET}"
    local subject_colors="${_GX_HOOKS_PCMSG_SUBJECT_COLOR}${subject}${F_RESET}"

    local complete_message_colors="${reference_colors}${type_colors}${final_type_split}${subtype_colors}(${mainscope_colors})${main_split}${subject_colors}"

    tput cuu1
    tput el
    echo -e "${complete_message_colors}"
    printf "%s\n" "${split}"

    if [ "${subject}" != "*" ]; then
        echo ""
        if [[ "${trigger_by_hook}" == 1 ]]; then
            echo "${complete_message}" >"${commit_msg}"
        else
            git commit -m "${complete_message}"
        fi
    else
        echo -e "${C_BG_LIGHT_RED} commit aborted ${F_RESET}"
        exit 1
    fi

    gx_hooks_pcmsg_next_step
}

function gx_hooks_pcmsg_git_config_local_get() {
    git config $1
}

function gx_hooks_pcmsg_git_config_local_remove() {
    git config --unset $1
}

# gx_hooks_pcmsg_git_config_local_set return an error for the moment !
function gx_hooks_pcmsg_git_config_local_set() {
    git config $1 $2
}

function gx_hooks_pcmsg_print_type() {
    local color=$1
    local type=$2
    local shortcut=$3
    local description=$4

    local type_column="$(gx_hooks_pcmsg_col_fixed_width 11 "${type}")"
    local shortcut_lengh=${#shortcut}

    gx_print_colors " ${color}${shortcut}${F_RESET}${type_column:$shortcut_lengh}${description}"
}

function gx_hooks_pcmsg_col_fixed_width() {
    local width=$1
    local text=$2

    if [[ "${width}" < 1 ]]; then
        width=1
    fi

    local text_length=${#text}
    local spaces=""

    for ((i = ${text_length}; i < ${width}; i++)); do
        spaces="${spaces}."
    done

    gx_print_colors "${text} ${C_DARK_GRAY}${spaces}${F_RESET} "
}

function gx_hooks_pcmsg_next_step() {
    step=$((step + 1))
}

function gx_hooks_pcmsg_previous_step() {
    step=$((step - 1))
}
