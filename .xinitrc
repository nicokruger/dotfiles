xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'
xset r rate 300 50
xset -b
# set wallpaper
bash /home/nicok/.wallpaper.sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec i3
