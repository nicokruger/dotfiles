#!/bin/bash

find /home/nicok/play/RedditImageGrab/wallpaper -type f -print0 | shuf -n1 -z | xargs -0 feh --bg-max
#feh --bg-max /home/nicok/play/RedditImageGrab/wallpaper/primary1.jpg

