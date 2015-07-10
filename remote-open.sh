#!/bin/bash

REMOTE_ADDR=$1
if [ -z "$REMOTE_ADDR" ]; then
   REMOTE_ADDR=`zenity --entry --text="Enter the host string"`
fi
# Reverse tunnel
ssh -N $REMOTE_ADDR -R 0.0.0.0:2222:localhost:22 &
PID=$!
sleep 2
if kill -0 $PID; then
   zenity --info --text="Click ok to close the connection"
   kill $PID
else
   zenity --info --text="Failed to establish connection"
fi
