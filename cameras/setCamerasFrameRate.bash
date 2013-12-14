#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage:"
  echo "$0 framerate"
  exit -1
fi

framerate=$1
echo "Setting the framerate to $framerate"
rosrun dynamic_reconfigure dynparam set /camera0 frame_rate $framerate
rosrun dynamic_reconfigure dynparam set /camera1 frame_rate $framerate
