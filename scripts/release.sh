#!/usr/bin/env bash

# Usage:
# $ . scripts/release.sh

function bump_version_from_to() {
  local files="$@"

  local SPLIT="——————————————————————————————————————————————————————————————————————"
  local F_RESET="\033[0m"
  local C_BLUE="\033[34m"
  local C_GREEN="\033[32m"
  local C_YELLOW="\033[33m"
  local C_LIGHT_YELLOW="\033[93m"
  local ENCODE_SPACE="+"
  local ENCODE_SHARP="%23"
  local ENCODE_NEW_LINE="%0A"

  local BRANCH_RELEASE_PREFIX="release-stage"
  local BRANCH_RELEASE_NEXT_SUFFIX="next"
  local BRANCH_MAIN="main"
  local RELEASE_LABEL="Release"
  local PRERELEASE_LABEL="Pre-release"

  local current_remote_origin_url=$(git config remote.origin.url)
  local current_remote_origin_url_last_element=${current_remote_origin_url##*@}         # get the string after '@'
  local current_github_project="https://${current_remote_origin_url_last_element/:/\/}" # change ':' by '/'
  current_github_project="${current_github_project/.git/}"                              # remove '.git'

  local release_title="${RELEASE_LABEL}"
  local prerelease=0
  local last_tag=$(git describe --tags --abbrev=0)
  local step=0

  local prompt_yes_no_choice=""

  function prompt_yes_no() {
    local YES="yes"
    local YES_SHORT="y"
    local NO="no"
    local NO_SHORT="n"

    local choice
    local label=$1
    local default=$2

    prompt_yes_no_choice=""

    case $default in
    "${YES}" | "${YES_SHORT}") default="${YES}" ;;
    "${NO}" | "${NO_SHORT}") default="${NO}" ;;
    *) default="${YES}" ;;
    esac

    while true; do
      echo -e -n "${C_GREEN}> ${label}? (yes/no) ${C_LIGHT_YELLOW}[${default}]${F_RESET} "

      exec </dev/tty
      read choice

      if [[ "${default}" =~ (""|"${YES}"|"${YES_SHORT}"|"${NO}"|"${NO_SHORT}") ]]; then
        break
      fi
    done

    case $choice in
    "${YES}" | "${YES_SHORT}") choice="${YES}" ;;
    "${NO}" | "${NO_SHORT}") choice="${NO}" ;;
    *) choice="${default}" ;;
    esac

    prompt_yes_no_choice="${choice}"
  }

  local prompt_response=""

  function prompt() {
    local label=$1
    local example=$2
    local default=$3

    local complete_label="${C_GREEN}> ${label}"
    if [ "${example}" != "" ]; then
      complete_label+=" (e.g. ${C_LIGHT_YELLOW}${example}${C_GREEN})"
    fi
    complete_label+=":"
    if [ "${default}" != "" ]; then
      complete_label+=" ${C_LIGHT_YELLOW}[${default}]"
    fi
    complete_label+="${F_RESET} "

    while true; do
      echo -e -n "${complete_label}"

      exec </dev/tty
      read text

      if [ "${text}" == "" -a "${default}" != "" ]; then
        text="${default}"
      fi

      if [ "${text}" != "" ]; then
        prompt_response="${text}"
        break
      fi
    done
  }

  function replace_first_occurrence() {
    local from="$1"
    shift
    local to="$1"
    shift
    local files="$@"

    for file in $files; do
      echo
      echo "#"
      echo "# Replace '${from}' by '${to}' in '${file}'"
      echo "#"
      echo

      # Replace only first occurrence
      sed -i "0,/${from}/{s/${from}/${to}/}" "${file}"
      git diff "${file}"
    done
  }

  function url_encode_light() {
    local url=$1
    url="${url// /${ENCODE_SPACE}}"
    url="${url//#/${ENCODE_SHARP}}"
    url="${url//\\n/${ENCODE_NEW_LINE}}"

    echo "${url}"
  }

  prompt "Create tag on the branch" "" "${BRANCH_MAIN}"
  local branch_target="${prompt_response}"

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Switch on the branch '${branch_target}' & Get last tags${F_RESET}"
  echo
  echo "$ git switch ${branch_target}"
  echo "$ git pull --ff origin ${branch_target}"

  prompt_yes_no "Run the above git commands"
  local switch_on_target="${prompt_yes_no_choice}"

  if [ "${switch_on_target}" == "yes" ]; then
    git switch "${branch_target}" &&
      git pull --ff origin "${branch_target}"
  fi

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Define the release${F_RESET}"
  echo

  prompt "Last release" "" "${last_tag}"
  local from="${prompt_response}"

  prompt "Next release" "v2.1.0"
  local to="${prompt_response}"

  prompt_yes_no "As pre-release" "no"
  local prerelease_choice="${prompt_yes_no_choice}"

  if [ "${prerelease_choice}" == "yes" ]; then
    release_title="${PRERELEASE_LABEL}"
    prerelease=1
  fi

  echo
  echo -e "${C_BLUE}#${F_RESET}"
  echo -e "${C_BLUE}# ${release_title}${F_RESET}"
  echo -e "${C_BLUE}# - Project: ${C_LIGHT_YELLOW}${current_github_project}${F_RESET}"
  echo -e "${C_BLUE}# - Branch : ${C_LIGHT_YELLOW}${branch_target}${F_RESET}"
  echo -e "${C_BLUE}# - From   : ${C_LIGHT_YELLOW}${from}${F_RESET}"
  echo -e "${C_BLUE}# - To     : ${C_LIGHT_YELLOW}${to}${F_RESET}"
  echo -e "${C_BLUE}#${F_RESET}"

  local branch_release="${BRANCH_RELEASE_PREFIX}-${to}"

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Create the branch '${branch_release}'${F_RESET}"
  echo
  echo "$ git switch -c ${branch_release}"

  prompt_yes_no "Run the above git commands"
  local new_release_choice="${prompt_yes_no_choice}"

  if [ "${new_release_choice}" == "yes" ]; then
    git switch -c "${branch_release}"
  fi

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Replace the version${F_RESET}"
  echo

  prompt_yes_no "Replace '${from}' by '${to}' in the files [${files// /, }]"
  local replace_choice="${prompt_yes_no_choice}"

  if [ "${replace_choice}" == "yes" ]; then
    replace_first_occurrence "${from}" "${to}" "${files}"
  fi

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Save the files modifications${F_RESET}"
  echo

  echo "$ git commit --all -m \"release: bump version to ${to}\""
  echo "$ git push origin ${branch_release}"

  prompt_yes_no "Run the above git commands"
  local save_files_choice="${prompt_yes_no_choice}"

  if [ "${save_files_choice}" == "yes" ]; then
    git commit --all -m "release: bump version to ${to}" &&
      git push origin "${branch_release}"
  fi

  local new_pr_release_url="${current_github_project}/compare/${branch_target}...${branch_release}"
  new_pr_release_url+="?quick_pull=1"
  new_pr_release_url+="&title=${release_title}${ENCODE_SPACE}${to}"

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Create the pull request on the branch '${branch_target}' [ON GITHUB]${F_RESET}"
  echo

  echo -e "- Go on      : ${C_YELLOW}${new_pr_release_url}${F_RESET}"
  echo "- Click on the button \"Create pull request\""
  echo -e "- Title      : ${C_YELLOW}${release_title} ${to}${F_RESET}"
  echo "- Description: Empty"
  echo "- Click on the button \"Merge the pull request\""

  prompt "PR id" "210"
  local pr_id="${prompt_response}"

  local new_tag_description="## ${release_title} ${to}\n**Pull Request**: #${pr_id}\n**Full Changelog**: ${current_github_project}/compare/${from}...${to}"

  local new_tag_url="${current_github_project}/releases/new"
  new_tag_url+="?tag=${to}"
  new_tag_url+="&target=${branch_target}"
  new_tag_url+="&title=${to}"
  new_tag_url+="&body=${new_tag_description}"

  if [ "${prerelease}" == 1 ]; then
    new_tag_url+="&prerelease=1"
  fi

  new_tag_url=$(url_encode_light "${new_tag_url}")

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Tag the merge commit on the branch '${branch_target}' [ON GITHUB]${F_RESET}"
  echo

  echo -e "- Go on        : ${C_YELLOW}${new_tag_url}${F_RESET}"
  echo -e "- Tag version  : ${C_YELLOW}${to}${F_RESET}"
  echo "- Target       : Choose the branch '${branch_target}'"
  echo -e "- Release title: ${C_YELLOW}${to}${F_RESET}"
  echo "- Describe this release (copy/past the following text):"
  echo
  echo -e "${C_YELLOW}${new_tag_description}${F_RESET}"
  echo

  if [ "${prerelease}" == 1 ]; then
    echo "- Set as a pre-release"
  fi

  echo "- Click on the button \"Publish release\""

  local branch_next="${to}-${BRANCH_RELEASE_NEXT_SUFFIX}"

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Clean & Update all${F_RESET}"
  echo
  echo "$ git push origin --delete ${branch_release}"
  echo "$ git switch ${branch_target} -f"
  echo "$ git branch -D ${branch_release}"
  echo "$ git pull --ff origin ${branch_target}"

  prompt_yes_no "Run the above git commands"
  local clean_update_choice="${prompt_yes_no_choice}"

  if [ "${clean_update_choice}" == "yes" ]; then
    git push origin --delete "${branch_release}" &&
      git switch "${branch_target}" -f &&
      git branch -D "${branch_release}" &&
      git pull --ff origin "${branch_target}"
  fi

  ((step++))
  echo
  echo -e "${C_BLUE}${SPLIT}${F_RESET}"
  echo -e "${C_BLUE}${step}. Continue the job on the branch '${branch_next}' [LAST STEP]${F_RESET}"
  echo
  echo "$ git switch -c ${to}-${BRANCH_RELEASE_NEXT_SUFFIX}"

  prompt_yes_no "Run the above git commands"
  local next_branch_choice="${prompt_yes_no_choice}"

  if [ "${next_branch_choice}" == "yes" ]; then
    git switch -c "${to}"-"${BRANCH_RELEASE_NEXT_SUFFIX}"
  fi

  echo
}

FILES="README.adoc params/default/params.version.sh"
bump_version_from_to "${FILES}"
