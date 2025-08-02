#!/bin/bash
set -eo pipefail
##################################################################################################################
# Author    : Pedro Teodoro
# Github    : https://github.com/pt-kaos
##################################################################################################################
#tput setaf Colors:
#     0 = black
#     1 = red
#     2 = green
#     3 = yellow
#     4 = darkblue
#     5 = purple
#     6 = cyan
#     7 = gray
#     8 = lightblue
##################################################################################################################

tput setaf 4
echo "=============================================================="
echo "                    Updating $(basename $0)"
echo "=============================================================="
tput sgr0

message="New update"

workdir=$(pwd)

while getopts ":m:" opt; do
  case ${opt} in
    m )
      if [[ -n "$OPTARG" ]]; then
        message="$OPTARG"
      fi
      ;;
    \? )
      echo "Usage: $0 [-m <message>]"
      exit 1
      ;;
  esac
done

# Send Everything to Github
git add --all .

git commit -m "$message"    # Commit to local repository with a default message

# Push the local files to github
branch=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$branch"

echo
tput setaf 6
echo "=============================================================="
echo "                    $(basename $0) done"
echo "=============================================================="
tput sgr0
echo
