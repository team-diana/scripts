#!/bin/bash

rosrun rqt_logger_level rqt_logger_level &

xdotool type "rosparam set /ImuFilter/gain 0.005"
xdotool key KP_Enter

xdotool type "rosparam set  /adc/filtered_imu true"
xdotool key KP_Enter

xdotool type 'rosservice call /Moving_Status "status: false"'
xdotool key KP_Enter

xdotool type 'rosservice call /suspension_controller/set_mode "mode: 0"'
xdotool key KP_Enter

xdotool type 'rosservice call /suspension_controller/set_height "height: 0.20"'
xdotool key KP_Enter
