#!/bin/bash

# Define your service
SERVICE=emby-server

if (( $(ps -ef | grep -v grep | grep $SERVICE | wc -l) < 1 ))
then
        # Service is not started, now start it.
        echo "$SERVICE is starting!!!"
        sudo service emby-server start
fi
