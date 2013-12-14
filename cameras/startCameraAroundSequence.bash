#!/bin/bash
rosrun camera_around camera_around_node.py&
wait=2
echo "Waiting $wait seconds..." 
sleep 2
echo "Starting the default sequence:"
#rosservice call /camera_around/start_sequence "{pan_min: -1.0, pan_max: 1.0, pan_step: 1.0, tilt_min: -0.4, tilt_max: 0.4, tilt_step: 0.8}"
rosservice call /camera_around/start_sequence "{pan_min: -1.0, pan_max: 0.0001, pan_step: 1.0, tilt_min: -0.4, tilt_max: 0.4, tilt_step: 0.8}"
