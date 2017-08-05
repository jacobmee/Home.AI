#!/usr/bin/env bash

# reboot shadowsocks server
ssh root@www.mitang.me -p 202 reboot

# reboot shadowsokcs client
ssh root@192.168.0.1 -p 202 reboot