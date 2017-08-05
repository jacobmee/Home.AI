#!/usr/bin/env bash

# Define so files for mjpg-streamer
export LD_LIBRARY_PATH=/usr/local/lib/mjpg-streamer

case "$1" in
    start)
        count=`pgrep mjpg_streamer | wc -l`
        if [ $count -eq 0 ]; then
            echo "Starting MJPG..."
            sudo modprobe bcm2835-v4l2
            mjpg_streamer -i "input_uvc.so -d /dev/video0 -n -y -f 25 -r 640x480" -o "output_http.so -n -w /usr/local/www"
        else
            echo "MJPG already started"
        fi
        ;;
    stop)
        count=`pgrep mjpg_streamer | wc -l`
        if [ $count -eq 0 ]; then
            echo "MJPG didn't start yet"
        else
            echo "Killing MJPG"
            kill $(pgrep mjpg_streamer)
        fi
        ;;
    *)
        echo "Usage: start|stop"
        exit 1
        ;;
esac
exit 0
