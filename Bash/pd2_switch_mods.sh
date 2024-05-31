#!/bin/sh
# Switch Payday 2 mods folder from normal to VR.

PD2_DIR="/c/Program Files (x86)/Steam/steamapps/common/PAYDAY 2"
MODE_FILE="$PD2_DIR/mods/mode.txt"
PD2_MODS_DIR="$PD2_DIR/mods"
PD2_MODS_VR_DIR="$PD2_DIR/mods_vr"
PD2_MODS_NORMAL_DIR="$PD2_DIR/mods_normal"

# Check if the mode file exists.
if [ ! -f "$MODE_FILE" ]; then
    echo "Mode file not found."
    exit 1
fi

# Read the mode file.
MODE=$(cat "$MODE_FILE")

# Switch the mods.
# Delete old 'mods' and make a copy of the other one.
if [ "$MODE" = "normal" ]; then
    rm -rf "$PD2_MODS_DIR"
    cp -r "$PD2_MODS_VR_DIR" "$PD2_MODS_DIR"
    echo "Switched to VR mods."
    echo "vr" > "$MODE_FILE"
    elif [ "$MODE" = "vr" ]; then
    rm -rf "$PD2_MODS_DIR"
    cp -r "$PD2_MODS_NORMAL_DIR" "$PD2_MODS_DIR"
    echo "Switched to normal mods."
    echo "normal" > "$MODE_FILE"
else
    echo "Invalid mode."
    exit 1
fi