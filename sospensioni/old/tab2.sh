#!/bin/bash

rosrun dynamixel_driver set_servo_config.py --port=/dev/ttyUSB0 --baud 57600 --ccw-angle-limit=0 1

roslaunch dynamixel_controllers motor.launch &

roslaunch dynamixel_controllers controller_torque.launch

rostopic pub /motore_1_controller/command std_msgs/Float64 "data: 0.5" -1

rosnode kill dynamixel_manager

rosrun dynamixel_driver set_servo_config.py --port=/dev/ttyUSB0 --baud 57600 --ccw-angle-limit=4095 1

roslaunch dynamixel_controllers motor.launch &

roslaunch dynamixel_controllers controller.launch

rostopic pub /motore_1_controller/command std_msgs/Float64 "data: 3.14" -1
