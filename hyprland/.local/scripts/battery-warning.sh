#!/bin/bash

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
  charging=$(cat /sys/class/power_supply/BAT1/status)
  
  if [ "$bat_lvl" -le 20 ] && [ "$charging" != "Charging" ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
    sleep 600
  else
    sleep 120
  fi
done

