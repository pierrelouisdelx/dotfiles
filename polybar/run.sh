#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get Wifi interface
for dev in `ls /sys/class/net`; do
    [ -d "/sys/class/net/$dev/wireless" ]
    w=$dev
done

# Launch polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m WLAN=$w polybar main --reload &
done
