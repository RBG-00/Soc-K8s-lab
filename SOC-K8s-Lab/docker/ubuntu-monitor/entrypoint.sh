#!/bin/bash
set -e

echo "Starting rsyslog..."
mkdir -p /run/sshd
touch /var/log/auth.log
rsyslogd

echo "Starting SSH server..."
/usr/sbin/sshd

echo "Starting Node Exporter..."
/opt/node_exporter/node_exporter &

echo "Registering Wazuh Agent..."

if [ ! -s /var/ossec/etc/client.keys ]; then
    /var/ossec/bin/agent-auth \
        -m host.docker.internal \
        -A ubuntu-monitor
fi

echo "Starting Wazuh..."
service wazuh-agent start

tail -F /var/ossec/logs/ossec.log /var/log/auth.log