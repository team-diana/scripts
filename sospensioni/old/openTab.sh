#!/bin/bash

scriptLocation=/home/diana/Scripts/sospensioni

WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID

echo "starting tab"

tabInitializationTime=2
for i in {2..2}; do
xdotool key ctrl+shift+t
echo "Starting tab no.$i"
sleep $tabInitializationTime #wait for tab to initialize
xdotool type "bash $scriptLocation/tab$i.sh"
xdotool key KP_Enter
done

echo "ALL tab started"

wmctrl -i -a $WID
