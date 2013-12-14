#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage:"
  echo "$0 packetsize"
  exit -1
fi

packetsize=$1
echo "Setting the packetsize to $packetsize"
rosrun dynamic_reconfigure dynparam set /camera0 packet_size $packetsize
rosrun dynamic_reconfigure dynparam set /camera1 packet_size $packetsize
