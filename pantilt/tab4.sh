#!/bin/bash

rostopic pub /ptu/cmd sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['pan']
position: [1]
velocity: [0.2]
effort: [0]" -1

sleep 10

rostopic pub /ptu/cmd sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['pan','tilt']
position: [-1,0.3]
velocity: [0.2,0.2]
effort: [0]" -1

sleep 10

rostopic pub /ptu/cmd sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['pan','tilt']
position: [0.4,-0.2]
velocity: [0.2,0.2]
effort: [0]" -1

sleep 10

rostopic pub /ptu/cmd sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['pan','tilt']
position: [0,0]
velocity: [0.2,0.2]
effort: [0]" -1