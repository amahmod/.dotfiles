#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

connected_monitor_count=$(xrandr | grep " connected " | awk "{ print$1 }" | wc -l )
echo $connected_monitor_count
if [ $connected_monitor_count -gt 1 ]; then
    polybar left --config=~/.config/polybar/config.ini &
    polybar right --config=~/.config/polybar/config.ini &
else
  polybar main --config=~/.config/polybar/config.ini &
fi
echo "Bars launched..."
