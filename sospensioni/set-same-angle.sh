#!/bin/bash

usage() {
  echo $0 angle_in_radians
}

if [[ $# != 1 ]]; then
  usage
else
  radians=$1
  degree=$( echo "$radians *  180 / 3.14" | bc )
  echo "setting all the suspension at $radians  (degree: $degree)"
  rostopic pub -1 /motore_1_controller/command std_msgs/Float64 "data: -$radians" & 
  rostopic pub -1 /motore_2_controller/command std_msgs/Float64 "data: -$radians" &
  rostopic pub -1 /motore_3_controller/command std_msgs/Float64 "data: $radians" &
  rostopic pub -1 /motore_4_controller/command std_msgs/Float64 "data: $radians" &
fi
