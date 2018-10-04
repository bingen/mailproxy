#!/usr/bin/env bash
if [ ! -z $DOVECOT_PWD_FILE -a -f $DOVECOT_PWD_FILE ]; then
    DOVECOT_PWD=`cat $DOVECOT_PWD_FILE`;
fi
sed -i "s|<DOVECOT_PWD>|${DOVECOT_PWD}|g" /etc/dovecot/local.conf

dovecot -F
