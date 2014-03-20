#!/bin/bash
source ../env.sh
source ../utils/utils.sh

cameraMods=('stereoOnly' 'stereoOnlyWithoutSync' 'all' 'allWithoutSync')

printBrLine
echo "Select camera modality:"

select MOD in ${cameraMods[*]}; do
  info "Starting $MOD..."

  launchFile="$CAMERAS_LAUNCH_DIR/$MOD.launch"
  startProcessInTerminal "roslaunch $launchFile"
  ok "Camera node started"

  if ask "Start stereo_image_proc?"; then
    info "Starting stereo_image_proc..."
    startProcessInTerminal "ROS_NAMESPACE=stereo rosrun stereo_image_proc stereo_image_proc"

    if ask "Show disparity windows?"; then
      startProcessInTerminal "rosrun image_view disparity_view image:=/stereo/disparity"
    fi
  fi

  exit 0
done




