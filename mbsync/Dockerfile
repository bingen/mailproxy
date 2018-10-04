FROM ubuntu:18.04

ARG UID
ARG GID

RUN apt-get update && apt-get install -y isync ca-certificates

RUN groupadd -r mailproxy -g ${GID} && useradd -r -u ${UID} -g mailproxy mailproxy
RUN mkdir -p /home/mailproxy/Maildir

COPY mbsync.conf /home/mailproxy/.mbsyncrc
COPY entry.sh imap_server.pem* /home/mailproxy/

RUN chown -R mailproxy:mailproxy /home/mailproxy

# As we are using a bind mount volume, we need to run entry.sh as root
# to change ownership, which is root by default. Then from there we run
# mbsync as mailproxy user.
#USER mailproxy
WORKDIR /home/mailproxy

ENTRYPOINT ["/home/mailproxy/entry.sh"]
