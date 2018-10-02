#!/usr/bin/env bash
sed -i "s|<IMAP_HOST>|${IMAP_HOST}|g" /home/mailproxy/.mbsyncrc
sed -i "s|<IMAP_USER>|${IMAP_USER}|g" /home/mailproxy/.mbsyncrc

if [ ! -z ${IMAP_PWD_FILE} -a -f ${IMAP_PWD_FILE} ]; then
    IMAP_PWD=`cat $IMAP_PWD_FILE`;
fi
sed -i "s|<IMAP_PASSWORD>|${IMAP_PWD}|g" /home/mailproxy/.mbsyncrc

# use self-signed certificate
if [ -f /home/mailproxy/imap_server.pem ]; then
    sed -i "s|/etc/ssl/certs/ca-certificates.crt|/home/mailproxy/imap_server.pem|g" /home/mailproxy/.mbsyncrc
fi

chown -R mailproxy:mailproxy /home/mailproxy/Maildir

su -c "mbsync -a" mailproxy
