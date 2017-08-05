#!/usr/bin/env bash
ping -c4 192.168.0.1 > /dev/null

if [ $? != 0 ]
then
  logger "================================================="
  logger "      NO WI-FI connection, restarting wlan0"
  logger "================================================="
  /sbin/ifdown 'wlan0'
  sleep 5
  /sbin/ifup --force 'wlan0'
fi