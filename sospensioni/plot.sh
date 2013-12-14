#!/bin/bash
xdotool type "set_term_title plot"
xdotool key KP_Enter

rosrun rqt_plot rqt_plot /status_asm/mot_pos_1:command_1:delta_1:load_1 &
rosrun rqt_plot rqt_plot /status_asm/mot_pos_2:command_2:delta_2:load_2 &
rosrun rqt_plot rqt_plot /status_asm/mot_pos_3:command_3:delta_3:load_3 &
rosrun rqt_plot rqt_plot /status_asm/mot_pos_4:command_4:delta_4:load_4 &

rosrun rqt_plot rqt_plot /status_asm/current_height:command_height &

rosrun rqt_plot rqt_plot /status_asm/mot_pos_4:roll:pitch &
