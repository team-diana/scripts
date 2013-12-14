#!/bin/bash

roslaunch dynamixel_controllers controller.launch

rosrun suspension_controller suspension_controller_node.py