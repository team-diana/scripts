#!/bin/bash

BASE=`pwd`
DEST="/etc"

for y in "init" "cron.d"; do
	for file in $( cd "$BASE/$y" && ls ); do
        if [[ "$file" != "README.md" ]]; then
            sudo cp "$BASE/$y/$file" "$DEST/$y"/team-diana-"$file" 2>&1 > /dev/null
            sudo chown root:root "$DEST/$y"/team-diana-"$file" 2>&1 > /dev/null
            sudo chmod +x "$DEST/$y"/team-diana-"$file" 2>&1 > /dev/null
        fi
	done
done