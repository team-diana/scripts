#!/bin/bash

BASE=`pwd`
DEST="/etc"

# make scripts belong to root, to force usage of root
sudo chown root:root -r cron/
sudo chmod +x -r cron/

for y in "init" "cron.d"; do
	for file in $( cd "$BASE/$y" && ls ); do
        if [[ "$file" != "README.md" ]]; then
            TO="$DEST/$y"/team-diana-"$file"
            sudo cp "$BASE/$y/$file" "$TO" 2>&1 > /dev/null
            sudo chown root:root "$TO" 2>&1 > /dev/null
            sudo chmod +x "$TO" 2>&1 > /dev/null
            if [[ "$y" == "cron.d" ]]; then
                crontab "$TO"
            fi
        fi
	done
done