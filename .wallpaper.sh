#!/bin/bash

find /home/nicok/stuff/wallpapers -type f -print0 | shuf -n1 -z | xargs -0 feh --bg-max
