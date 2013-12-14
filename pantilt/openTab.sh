#!/bin/bash

scriptLocation=/home/diana/Scripts/pantilt

WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID

echo "starting tab"

tabInitializationTime=2
for i in {1..4}; do
    xdotool key ctrl+shift+t
    echo "Starting tab no.$i"
    sleep $tabInitializationTime #wait for tab to initialize
    xdotool type "bash $scriptLocation/tab$i.sh"
    xdotool key KP_Enter
#    if [i = 2]; then
#       sleep 30
#    fi
done

echo "ALL tab started"

wmctrl -i -a $WID
