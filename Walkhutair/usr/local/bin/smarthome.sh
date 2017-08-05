#!/usr/bin/env bash

# Get where the current bash file located
BASH_DIR=$(cd `dirname $0`; pwd)

case "$1" in
    leave.home)
        echo "leave home actions"
        sh $BASH_DIR/rasp_video.sh start
        ;;
    back.home)
        echo "back home actions"
        sh $BASH_DIR/rasp_video.sh stop
        ;;
    *)
        echo "Usage: leave.home| back.home"
        exit 1
        ;;
esac
exit 0