#!/bin/bash
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)
THRESHOLD=30
CRITICAL=15

if [ "$STATUS" != "Charging" ]; then
    if [ "$BATTERY_LEVEL" -le "$CRITICAL" ]; then
        notify-send -u critical "Battery critical" "Battery level is ${BATTERY_LEVEL}%"
    elif [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
        notify-send -u normal "Battery low" "Battery level is ${BATTERY_LEVEL}%"
    fi
fi
