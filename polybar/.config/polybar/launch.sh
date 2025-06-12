#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar mybar_external &
fi

echo "Polybar launched..."
