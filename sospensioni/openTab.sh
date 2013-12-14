#!/bin/bash
xdotool type "set_term_title runner"
xdotool key KP_Enter

scriptLocation=/home/diana/Scripts/sospensioni

WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID

echo "starting tab"

tabInitializationTime=2
for i in {1..8}; do
xdotool windowfocus $WID
xdotool key ctrl+shift+t
echo "Starting tab no.$i"
sleep $tabInitializationTime #wait for tab to initialize
case $i in
1) xdotool type "set_term_title roscore"
;;
2) xdotool type "set_term_title rviz"
rosparam set /robot_description --textfile /home/diana/catkin_ws/src/vision/src/flir_pantilt_d46/diana_model.xml
;;
3) xdotool type "set_term_title ptu"
;;
4) xdotool type "set_term_title adc"
;;
5) xdotool type "set_term_title imu"
;;
6) xdotool type "set_term_title dyn"
;;
7) xdotool type "set_term_title susp"
;;
8) xdotool type "set_term_title param"
;;
esac
xdotool key KP_Enter
sleep 0.5
xdotool type "bash $scriptLocation/tab$i.sh"
xdotool key KP_Enter
sleep 5
done

echo "ALL tab started"

wmctrl -i -a $WID
