#!/usr/bin/env bash

echo "Raspberry Pi upgrades starting"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get autoclean

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")

echo " "
echo "==========================================================="
echo "       Upgrading accomplished @ $LOGTIME  "
echo "==========================================================="
