#!/bin/bash

BASE=`pwd`
DEST="/etc"

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. eg sudo $0"
    exit 1
fi

# make scripts belong to root, to force usage of root
chown -R root:root cron/
chmod -R +x cron/

# exclude README
chmod 644 cron/README.md

for y in "init" "cron.d"; do
	for file in $( cd "$BASE/$y" && ls ); do
        if [[ "$file" != "README.md" ]]; then
            TO="$DEST/$y"/team-diana-"$file"
            cp "$BASE/$y/$file" "$TO" 2>&1 > /dev/null
            chown root:root "$TO" 2>&1 > /dev/null
            chmod +x "$TO" 2>&1 > /dev/null
            if [[ "$y" == "cron.d" ]]; then
                crontab "$TO"
            fi
        fi
	done
done