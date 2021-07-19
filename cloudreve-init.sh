#!/bin/sh
# Generate salt and session key if keys are empty
# Refer: https://github.com/cloudreve/Cloudreve/blob/db7489fb612f8227beaef874ca4c7cb2a6bafcc1/pkg/util/common.go#L15
if ! egrep '^SessionSecret = \w+' /etc/cloudreve.ini; then
    sed -i 's/^\(SessionSecret = \).*/\1'$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 64)'/' /etc/cloudreve.ini
fi 
if ! egrep '^HashIDSalt = \w+' /etc/cloudreve.ini; then
    sed -i 's/^\(HashIDSalt = \).*/\1'$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 64)'/' /etc/cloudreve.ini
fi
# Create account if not exists
if ! id -u cloudreve >/dev/null 2>&1; then
    useradd -r -c "Cloudreve user" -d /opt/cloudreve -s /bin/nologin cloudreve
fi
# Create database dir if not exist
if [ ! -d "/opt/cloudreve/database" ]; then
    mkdir -p /opt/cloudreve/database
    chown -R cloudreve:cloudreve /opt/cloudreve/database
fi
# Create file dir if not exist
if [ ! -d "/opt/cloudreve/uploads" ]; then
    mkdir -p /opt/cloudreve/uploads
    chown -R cloudreve:cloudreve /opt/cloudreve/uploads
fi

exit 0