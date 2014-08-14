#!/bin/bash
WALL=$(find /home/nicok/play/RedditImageGrab/wallpaper -type f -print0 | shuf -n1 -z | xargs -0 echo)
echo "Wall is: ${WALL}"
#TMP="$(mktemp).png"
#convert $WALL $TMP

TMP=$(/home/nicok/play/walle/a.py $WALL)

i3lock -t -u -i "$TMP"


