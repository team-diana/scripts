#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
   echo "Usage: $0 pan_value tilt_value "
   exit -1
fi

pan_max=1
pan_min=-1
tilt_max=0.5
tilt_min=-0.5

pan_target=$1
tilt_target=$2

function between {
  if [[ $(echo "$2 > $1" | bc) == 1 ]]  && [[ $(echo "$2 < $3" | bc) == 1 ]] ; then 
    echo 1
  else 
    echo 0
  fi
}

if [[ $(between $pan_min $pan_target $pan_max) == 0 ]]; then
   echo "pan_value must be between $pan_min and $pan_max"
   echo "pan_value was $pan_target"
   exit -1
fi
if [[ $(between $tilt_min $tilt_target $tilt_max) == 0 ]]; then
   echo "tilt_value must be between $tilt_min and $tilt_max"
   echo "tilt_value was $tilt_target"
   exit -1
fi

rostopic pub /ptu/cmd sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['pan', 'tilt']
position: [$pan_target, $tilt_target]
velocity: [0.1, 0.1]
effort: [0]"
