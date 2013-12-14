#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage:"
  echo "$0 delay"
  exit -1
fi

delay=$1
echo "Setting the delay to $delay"
rosrun dynamic_reconfigure dynparam set /camera0 packet_delay $delay
rosrun dynamic_reconfigure dynparam set /camera1 packet_delay $delay
