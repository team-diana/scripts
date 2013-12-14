#!/bin/bash

BASE=`pwd`
DEST="/etc"

for y in {init, cron}; do
	for file in $( ls ); do
		sudo ln -s "$BASE/$y"/"$file" "$DEST/$y"/team-diana-"$file" 2>&1 > /dev/null
	done
done