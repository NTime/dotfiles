#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# Deluge Daemon
deluged &

# Keyboard Layout
setxkbmap br &

# Display Resolution option for when in a VM
#xrandr --output Screen 0 --mode 1920x1080 &

# Display Resolution option for when in dual monitor:
# notebook(1920x1080) and side monitor(2560x1080)
# Notebook only: 
#xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP1 --off --output HDMI2 --off &
# Monitor only:
# xrandr --output eDP1 --off --output HDMI1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off &
# Both:
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 2560x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output HDMI-2 --off
fi

# Wallpaper
~/.scripts/fehbg &

# Cursor
xsetroot -cursor_name left_ptr &

# Execute bspwm
exec bspwm
