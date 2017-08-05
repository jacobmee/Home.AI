#!/bin/sh

# Get where the current bash file located
BASH_DIR=$(cd `dirname $0`; pwd)

# Renew the certifates, run the hook bash if successful
certbot renew --renew-hook $BASH_DIR/hook-script.sh
