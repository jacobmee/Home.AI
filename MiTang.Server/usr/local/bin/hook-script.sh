#!/bin/sh

set -e

# Get where the current bash file located
BASH_DIR=$(cd `dirname $0`; pwd)

renew_certs_root=/etc/letsencrypt/live/mail.mitang.me
deploying_cert_root=/etc/ssl/mail
mail_txt=$BASH_DIR/renew-certs/mail.txt

cert_pem=mitang.pem
key_pem=key.pem

# Make sure the certificate and private key files are
# never world readable, even just for an instant while
# we're copying them into deploying_cert_root.
umask 077

cp "$renew_certs_root/fullchain.pem" "$deploying_cert_root/$cert_pem"
cp "$renew_certs_root/privkey.pem" "$deploying_cert_root/$key_pem"

# Apply the proper file ownership and permissions for
# the daemon to read its certificate and key.
chown postfix "$deploying_cert_root/$cert_pem" \
        "$deploying_cert_root/$key_pem"
chown dovecot "$deploying_cert_root/$cert_pem" \
        "$deploying_cert_root/$key_pem"
chmod 400 "$deploying_cert_root/$cert_pem" \
        "$deploying_cert_root/$key_pem"

service postfix restart >/dev/null
service dovecot restart >/dev/null

cat "$mail_txt" | msmtp -a default admin@mitang.me
