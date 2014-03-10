#!/bin/bash

BASE=`pwd`
DEST="/etc"

# make scripts belong to root, to force usage of root
sudo chown -R root:root cron/
sudo chmod -R +x cron/

# exclude README
sudo chmod 644 cron/README.md

for y in "init" "cron.d"; do
	for file in $( cd "$BASE/$y" && ls ); do
        if [[ "$file" != "README.md" ]]; then
            TO="$DEST/$y"/team-diana-"$file"
            sudo cp "$BASE/$y/$file" "$TO" 2>&1 > /dev/null
            sudo chown root:root "$TO" 2>&1 > /dev/null
            sudo chmod +x "$TO" 2>&1 > /dev/null
            if [[ "$y" == "cron.d" ]]; then
                sudo crontab "$TO"
            fi
        fi
	done
done