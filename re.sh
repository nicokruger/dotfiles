xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'
xset r rate 300 50
xset -b

xrandr --output HDMI1 --auto --right-of LVDS1

~/play/dotfiles/.wallpaper.sh
