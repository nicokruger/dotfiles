#!/bin/sh
# shell script to prepend i3status with more stuff


i3status | while :
do
    SONG=$(cmus-remote -Q 2> /dev/null| sed "s;tag ;;g" | sed "s; ;=;" | python -c "import sys, collections; params=collections.defaultdict(lambda: 'N/A'); params.update(dict(line.strip().split('=') for line in sys.stdin.readlines())); params and print('%(artist)s - %(album)s - %(tracknumber)s - %(title)s' % params)")
    read line
    echo "${SONG} | $line" || exit 1
done

