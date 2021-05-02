#!/usr/bin/env bash

# terminate already running bar instances
killall -q polybar

# wait until processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch polybar using default config location ~/.config/polybar/config
polybar main &

echo "Polybar launched"
