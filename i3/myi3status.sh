#!/bin/sh
# shell script to prepend i3status with more stuff


i3status | while :
do
        SONG=$(cmus-remote -Q | sed "s;tag ;;g" | sed "s; ;=;" | python -c "import sys; params=dict(line.strip().split('=') for line in sys.stdin.readlines()); print('%(artist)s - %(album)s - %(tracknumber)s - %(title)s' % params)")
        read line
        echo "${SONG} | $line" || exit 1
done

