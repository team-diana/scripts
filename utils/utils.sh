#!/bin/bash

source $SCRIPTS_DIR/utils/colors.sh

printBrLine() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

info() {
  clr_cyan "$@"
}

ok() {
  clr_green "$@"
}

die() {
  clr_red "ERROR: $@"
}

function ask {
while true; do
  if [ "${2:-}" = "Y" ]; then
    prompt="Y/n"
    default=Y
  elif [ "${2:-}" = "N" ]; then
    prompt="y/N"
    default=N
  else
    prompt="y/n"
    default=
  fi
  # Ask the question
  read -p "$1 [$prompt] " REPLY
  # Default?
  if [ -z "$REPLY" ]; then
    REPLY=$default
  fi
  # Check if the reply is valid
  case "$REPLY" in
    Y*|y*) return 0 ;;
  N*|n*) return 1 ;;
esac
done
}

function startProcessInTerminal {
  /usr/bin/gnome-terminal -e "bash -c 'source $CATKIN_WS/devel/setup.bash ; $@'"
}
