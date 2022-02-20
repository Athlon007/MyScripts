#!/bin/bash
# By Konrad Figura
#
# This script changes the system theme depending on time of day.
# Executed using 'at', using following command inside of ".profile" (CHANGE '18:00' TO DESIRED TIME):
#
# atqoutput=`atq`
# if [ -z "$atqoutput" ]; then
#   at 18:00 -f /path/to/themeswitcher.sh 2> /dev/null
# fi


# Configure the values below.
LIGHT_THEME='Pop'
DARK_THEME='Pop-dark'
HOUR_LIGHT=8
HOUR_DARK=18


CURRENT_TIME=`date +"%H"`
CURRENT_THEME=`gsettings get org.gnome.desktop.interface gtk-theme | tr -d [\']`
THEME_TO_SET=''

if [ $CURRENT_TIME -ge $HOUR_DARK ] || [ $CURRENT_TIME -lt $HOUR_LIGHT ]; then
  THEME_TO_SET=$DARK_THEME
else
  THEME_TO_SET=$LIGHT_THEME
fi

if [ $CURRENT_THEME = $THEME_TO_SET ]; then
  echo "Themes are the same."
  exit
fi

gsettings set org.gnome.desktop.interface gtk-theme $THEME_TO_SET
echo "Theme changed to $THEME_TO_SET."
