#!/usr/bin/env bash

case "$1" in
    leave.home)
        echo "Tanghut: leave home actions"
        ssh pi@Walkhutair smarthome.sh leave.home
        ;;
    back.home)
        echo "Tanghut: back home actions"
        ssh pi@Walkhutair smarthome.sh back.home
        ;;
    *)
        echo "Usage: leave.home| back.home"
        exit 1
        ;;
esac
exit 0