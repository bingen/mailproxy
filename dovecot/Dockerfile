FROM ubuntu:18.04

ARG UID
ARG GID

RUN apt-get update && apt-get install -y dovecot-imapd

RUN groupadd -r mailproxy -g ${GID} && useradd -r -u ${UID} -g mailproxy mailproxy

RUN rm /etc/dovecot/conf.d/10-auth.conf
COPY dovecot.conf /etc/dovecot/local.conf
COPY entry.sh /home/mailproxy/entry.sh

RUN mkdir -p /home/mailproxy/Maildir
RUN chown -R mailproxy:mailproxy /home/mailproxy

ENTRYPOINT ["/home/mailproxy/entry.sh"]
