#!/usr/bin/bash

if [[ "$1" == "isCharging" ]]; then
  echo "$(acpi -b | grep -c 'Charging')"
fi
