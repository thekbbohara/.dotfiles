#!/bin/bash
battery=$(cat /sys/class/power_supply/BAT0/capacity)
# isCharging=$(acpi -b | grep -c 'Charging')

if [[ "$1" == "isCharging" ]]; then
  chargingStatus="$(acpi | awk '{print $3}')"
  if [[ "$chargingStatus" == "Discharging," ]]; then
    echo "🔋 "
  else
    echo "🔌"
  fi
else
  echo "$battery"
fi

