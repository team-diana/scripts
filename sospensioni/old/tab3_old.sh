#!/bin/bash
roslaunch dynamixel_controllers controller.launch

rostopic echo /motor_states/suspension_port