#!/bin/bash

# Simple script that changes the power mode of system76-power, depending if the laptop is connected to battery.
# Called using crontab, using following parameters:
#
# * * * * * /path/to/script.sh
#
# Also called in ".profile" file, using:
#
# /home/athlon/Apps/batt.sh -f


# By default, the power mode switching is disabled, if the current battery mode is set to BALANCED.
ignore_balanced_mode=false
if [[ $1 == *"f"* ]]; then
  ignore_balanced_mode=true
fi

if on_ac_power; then
  system76-power profile performance
else
  if ! $ignore_balanced_mode ; then
    if [[ $current_mode == *"Balanced"* ]]; then
      echo "ignore because Balanced is on."
      exit
    fi
  fi
  system76-power profile battery
fi
