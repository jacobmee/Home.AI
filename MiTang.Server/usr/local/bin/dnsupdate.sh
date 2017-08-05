#!/bin/bash

# Generating dnsmasq file for blocked sites
BASH_DIR=$(cd `dirname $0`; pwd)

python $BASH_DIR/gfwlist2dnsmasq/gfwlist2dnsmasq.py
echo "Copy sites file to www"
mv $BASH_DIR/dnsmasq_list.conf /var/www

# Generating DNS for apple ChinaNet
# cd /etc/dnsupdate/appleDNS
# python fetch-timeout.py ChinaNet.json
# python export-configure.py merlin > dnsmasq_apple.conf
# echo "Copy APPLE hosts to www"
# mv /etc/dnsupdate/appleDNS/dnsmasq_apple.conf /var/www
