#!/bin/bash

roslaunch dynamixel_controllers controller.launch

rostopic pub /motore_1_controller/command std_msgs/Float64 "data: 3.14" -1

rostopic pub /motore_2_controller/command std_msgs/Float64 "data: 3.14" -1

rostopic pub /motore_3_controller/command std_msgs/Float64 "data: 3.14" -1

rostopic pub /motore_4_controller/command std_msgs/Float64 "data: 3.14" -1


sleep 5

rosnode kill dynamixel_manager
sleep 3
rosrun dynamixel_driver set_torque.py --port=/dev/ttyUSB0 --baud 57600 1 Off
sleep 3
rosrun dynamixel_driver set_torque.py --port=/dev/ttyUSB0 --baud 57600 2 Off
sleep 3
rosrun dynamixel_driver set_torque.py --port=/dev/ttyUSB0 --baud 57600 3 Off
sleep 3
rosrun dynamixel_driver set_torque.py --port=/dev/ttyUSB0 --baud 57600 4 Off



#spegnere tutti i motori alla fine della dimostrazione
