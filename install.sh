#!/bin/bash
set -e
set -u

RCol='\033[0m'
Gre='\033[0;32m'
Red='\033[0;31m'
Yel='\033[0;33m'

## printing functions ##
function gecho {
  echo -e "${Gre}[message] $1${RCol}"
}

function yecho {
  echo -e "${Yel}[warning] $1${RCol}"
}

function wecho {
  # red, but don't exit 1
  echo -e "${Red}[error] $1${RCol}"
}

function recho {
  echo -e "${Red}[error] $1${RCol}"
  exit 1
}


# function for linking dotfiles

function linkdotfile {
  file="$1"
  if [ ! -e ~/$file -a ! -L ~/$file ]; then
      yecho "$file not found, linking..." >&2
      ln -s ~/dotfiles/$file ~/$file
  else
      gecho "$file found, ignoring..." >&2
  fi
}

linkdotfile .tmux.conf
