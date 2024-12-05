#!/bin/bash

# Open remote git repository in default browser
# Author: baolhq

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "fatal: not a git repository (or any of the parent directories): .git"
  exit 1
fi

branch=$(git symbolic-ref --short HEAD)
remote_url=$(git config --get remote.origin.url)

xdg-open "$remote_url"
