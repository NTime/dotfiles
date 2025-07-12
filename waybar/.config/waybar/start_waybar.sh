#!/bin/sh

killall waybar
sleep 0.2

waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
