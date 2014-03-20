#!/bin/bash

source ../env.sh
source $SCRIPTS_DIR/utils/utils.sh

declare -a FUNCTION
FUNCTION[1]="cameras"
FUNCTION[2]="pantilt"
FUNCTION[3]="rviz"
FUNCTION[4]="octomap"


cameras() {
  info "Cameras..."
  bash $SCRIPTS_DIR/cameras/stereoVisionWizard.sh
}

pantilt() {
  info "Pantilt..."
  startProcessInTerminal "roslaunch $CATKIN_WS/src/vision/src/flir_pantilt_d46/launch/diana.launch"
}

rviz() {
  info "Rviz..."
  startProcessInTerminal "rosrun rviz rviz"
}

octomap() {
  info "Octomap..."
  startProcessInTerminal "roslaunch $CATKIN_WS/Genova/genova.launch"
}

for i in "${!FUNCTION[@]}"; do   ${FUNCTION[$i]}; done


