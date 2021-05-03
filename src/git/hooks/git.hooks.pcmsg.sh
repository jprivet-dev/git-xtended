#!/usr/bin/env bash

function gx_hooks_pcmsg() {
    local split="--------------------------------------------------"

    local commit_msg=$1
    local commit_mode=$2

    local last_scope
    local last_reference
    local last_type_index

    local type
    local scope
    local subject
    local reference
    local step=0

    local subject_default

    local trigger_by_hook=0

    if [[ ".git/COMMIT_EDITMSG" == "${commit_msg}" ]]; then
        trigger_by_hook=1
    else
        subject_default="$@"
    fi

    local scope_prefix="("
    local scope_suffix=")"
    local main_split=": "
    local reference_split=" "
    local reference_hashtag="#"
    local reference_prefix="("
    local reference_suffix=")"
    local cancel_char="x"
    local clear_char="*"

    # --------------
    # TYPE

    declare -A types_index
    declare -A types_shortcut

    echo "user.name  : $(git config user.name)"
    echo "user.email : $(git config user.email)"
    printf "%s\n" "${split}"

    echo -e "MSG = ${_GX_HOOKS_PCMSG_TYPE_LABEL}${scope_prefix}${_GX_HOOKS_PCMSG_SCOPE_LABEL}${scope_suffix}${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL}${reference_split}${_GX_HOOKS_PCMSG_REFERENCE_LABEL}"
    printf "%s\n" "${split}"

    echo ""
    echo -e "${_GX_HOOKS_PCMSG_TYPE_LABEL}"

    for key in "${!_GX_HOOKS_PCMSG_TYPES[@]}"; do
        if [[ ${_GX_HOOKS_PCMSG_TYPES[$key]} =~ ([^\|]*)\|([^\|]*)\|([^\|]*) ]]; then
            shorcut=${BASH_REMATCH[1]}
            type=${BASH_REMATCH[2]}
            info=${BASH_REMATCH[3]}

            types_index[$shorcut]=$type
            types_shortcut[$shorcut]=$shorcut

            gx_hooks_pcmsg_print_type "${_GX_HOOKS_PCMSG_TYPE_SHORTCUT_COLOR}" "${type}" "${shorcut}" "${info}"
        fi
    done

    printf "\n%s\n" "${split}"
    echo "" # tricks : with tput cuu1 and el, that avoid new line with first ENTER action

    while true; do
        case $step in
        0)
            gx_hooks_pcmsg_type
            ;;
        1)
            gx_hooks_pcmsg_scope
            ;;
        2)
            gx_hooks_pcmsg_subject
            ;;
        3)
            gx_hooks_pcmsg_reference
            ;;
        4)
            gx_hooks_pcmsg_final_message
            ;;
        *)
            break
            ;;
        esac
    done
}

function gx_hooks_pcmsg_type() {
    local gx_git_get_commit_last_suggest=""

    last_type_index=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_TYPE_INDEX}")

    if [ "${last_type_index}" != "" ]; then
        gx_git_get_commit_last_suggest=" [${types_index[$last_type_index]}]"
    else
        gx_git_get_commit_last_suggest=""
    fi

    type=""

    while true; do
        tput cuu1
        tput el
        echo -e -n "${_GX_HOOKS_PCMSG_TYPE_LABEL} ${C_DARK_GRAY}<<<${F_RESET}${gx_git_get_commit_last_suggest} "

        exec </dev/tty
        read read_type_index

        if [ "${read_type_index}" == "${cancel_char}" ]; then
            break
        fi

        if [ "${read_type_index}" == "" ]; then
            choise_type_index="${last_type_index}"
        else
            choise_type_index_tab=(${read_type_index})
            choise_type_index="${choise_type_index_tab[0]}"
        fi

        choise_type_index_valid=0

        [[ " ${types_shortcut[@]} " =~ " ${choise_type_index} " ]]

        if [ "${BASH_REMATCH}" != "" ]; then
            choise_type_index_valid=1
        fi

        if [ "${choise_type_index_valid}" == 1 ]; then
            $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_TYPE_INDEX}" "${choise_type_index}")
            break
        fi
    done

    if [ "${read_type_index}" == "${cancel_char}" ]; then
        gx_hooks_pcmsg_previous_step
    else
        type=${types_index[$choise_type_index]}
        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_scope() {
    local last_scope_prompt=""
    last_scope=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SCOPE}")

    if [ "${last_scope}" != "" ]; then
        last_scope_prompt="[${last_scope}] "
    fi

    while true; do
        tput cuu1
        tput el
        echo -e -n "${type}${scope_prefix}${_GX_HOOKS_PCMSG_SCOPE_LABEL}${scope_suffix} ${C_DARK_GRAY}<<<${F_RESET} ${last_scope_prompt}"

        exec </dev/tty
        read read_scope

        break
    done

    if [ "${read_scope}" == "${cancel_char}" ]; then
        gx_hooks_pcmsg_previous_step
    else
        scope=""

        if [ "${read_scope}" == "" ]; then
            if [ "${last_scope}" != "" ]; then
                scope="${last_scope}${scope_split}"
            fi
        else
            scope="${read_scope}${scope_split}"
            $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SCOPE}" "${read_scope}")
        fi

        if [ "${scope}" == "" ]; then
            gx_hooks_pcmsg_git_config_local_remove "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_SCOPE}"
        fi

        gx_hooks_pcmsg_next_step
    fi
}


function gx_hooks_pcmsg_reference() {
    local last_reference_prompt=""
    last_reference=$(gx_hooks_pcmsg_git_config_local_get "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}")

    if [ "${last_reference}" != "" ]; then
        last_reference_prompt="${reference_prefix}${reference_hashtag}${last_reference}${reference_suffix}${clear_char} "
    fi

    while true; do
        tput cuu1
        tput el
        echo -e -n "${type}${scope_prefix}${scope}${scope_suffix}${main_split}${subject}${reference_split}${_GX_HOOKS_PCMSG_REFERENCE_LABEL} ${C_DARK_GRAY}<<<${F_RESET} ${last_reference_prompt}"

        exec </dev/tty
        read read_reference

        break
    done

    if [ "${read_reference}" == "${cancel_char}" ]; then
        gx_hooks_pcmsg_previous_step
    else
        reference=""

        if [ "${read_reference}" == "${clear_char}" ]; then
            read_reference=""
            last_reference=""
        fi

        if [ "${read_reference}" == "" ]; then
            if [ "${last_reference}" != "" ]; then
                reference="${reference_split}${reference_prefix}${reference_hashtag}${last_reference}${reference_suffix}"
            fi
        else
            reference="${reference_split}${reference_prefix}${reference_hashtag}${read_reference}${reference_suffix}"
            $(gx_hooks_pcmsg_git_config_local_set "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}" "${read_reference}")
        fi

        if [ "${reference}" == "" ]; then
            gx_hooks_pcmsg_git_config_local_remove "${GX_PARAMS_GIT_CONFIG_KEY_GIT_COMMIT_LAST_REFERENCE}"
        fi

        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_subject() {
    while true; do
        tput cuu1
        tput el
        echo -e -n "${type}${scope_prefix}${scope}${scope_suffix}${main_split}${_GX_HOOKS_PCMSG_SUBJECT_LABEL} ${C_DARK_GRAY}<<<${F_RESET} "

        exec </dev/tty
        read read_subject

        if [ "${read_subject}" == "${cancel_char}" ]; then
            break
        fi

        if [ "${read_subject}" != "" ]; then
            break
        fi
    done

    if [ "${read_subject}" == "${cancel_char}" ]; then
        gx_hooks_pcmsg_previous_step
    else
        subject="$read_subject"
        gx_hooks_pcmsg_next_step
    fi
}

function gx_hooks_pcmsg_final_message() {
    complete_message="${type}${scope_prefix}${scope}${scope_suffix}${main_split}${subject}${reference}"

    local type_colors="${_GX_HOOKS_PCMSG_TYPE_COLOR}${type}${F_RESET}"
    local scope_colors="${_GX_HOOKS_PCMSG_SCOPE_COLOR}${scope}${F_RESET}"
    local subject_colors="${_GX_HOOKS_PCMSG_SUBJECT_COLOR}${subject}${F_RESET}"
    local reference_colors="${_GX_HOOKS_PCMSG_REFERENCE_COLOR}${reference}${F_RESET}"

    local complete_message_colors="${type_colors}${scope_prefix}${scope_colors}${scope_suffix}${main_split}${subject_colors}${reference_colors}"

    tput cuu1
    tput el
    echo -e "${complete_message_colors}"
    printf "%s\n" "${split}"

    if [ "${subject}" != "${cancel_char}" ]; then
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

    for ((i = text_length; i < width; i++)); do
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
