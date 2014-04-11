#!/bin/bash

source $DIANA_SCRIPTS_DIR/utils/colors.sh

export CATKIN_WS=/home/diana/catkin_ws/
export CAMERAS_LAUNCH_DIR=$CATKIN_WS/catkin_ws/src/vision/src/pgr_camera/launch/

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

# $1 tab name
# ${@:2} process and arguments 
function startProcessInTerminal {
 tabName=$1
 shift
 konsole --new-tab -p LocalTabTitleFormat="$tabName" -e 'execute' $@
}
