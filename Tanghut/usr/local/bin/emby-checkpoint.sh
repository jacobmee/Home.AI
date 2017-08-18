#!/bin/bash

# Define your service
SERVICE=emby-server

#check mount files first
mountpoint /usr/nas/music || sudo mount -av
mountpoint /usr/nas/video || sudo mount -av

#check emby-service
if (( $(ps -ef | grep -v grep | grep $SERVICE | wc -l) < 1 ))
then
        # Service is not started, now start it.
        echo "$SERVICE is starting!!!"
        sudo service emby-server start
fi