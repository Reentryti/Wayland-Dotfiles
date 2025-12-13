#!/bin/bash

#   Recorder script with wl-recorder

# Video Directory (create if not done yet)
DIR="$HOME/Vidéos/Records"
mkdir -p "$DIR"

# FileName & PidName
FILENAME="$DIR/record_$(date + '%Y-%m-%d_%H-%M-%S').mp4"
PIDFILE="/tmp/wf-recorder.pid"

# Stop recording with notify
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    kill "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"
    notify-send "Video enregistre sous $FILENAME"
    exit 0
fi 

# Start recording
notify-send "Enregistrement lancé"
wf-recorder --file "$FILENAME" &
echo $! > "$PIDFILE"

