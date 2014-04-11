#!/bin/bash
source $DIANA_SCRIPTS_DIR/utils/utils.sh

declare -a FUNCTION
FUNCTION[3]="cameras"
FUNCTION[1]="pantilt"
FUNCTION[2]="rviz"
FUNCTION[4]="octomap"

function startProcessInTerminalAndPause {
  startProcessInTerminal $@ &
  sleep 3s
}


cameras() {
  info "Cameras..."
  bash $DIANA_SCRIPTS_DIR/cameras/stereoVisionWizard.sh
}

pantilt() {
  info "Pantilt..."
  startProcessInTerminal "pantilt" "roslaunch $CATKIN_WS/src/vision/src/flir_pantilt_d46/launch/diana.launch"
}

rviz() {
  info "Rviz..."
  startProcessInTerminal "rviz" "rosrun rviz rviz"
}

octomap() {
  if ask "Start Octomap?"; then
    info "Octomap..."
    startProcessInTerminal "octomap" "roslaunch $CATKIN_WS/Genova/genova.launch"
  fi
}

for i in "${!FUNCTION[@]}"; do   ${FUNCTION[$i]}; done


