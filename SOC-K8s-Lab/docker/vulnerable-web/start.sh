#!/bin/bash
set -e

echo "[+] Starting Wazuh Agent..."
/var/ossec/bin/wazuh-control start

echo "[+] Starting DVWA..."
exec docker-php-entrypoint apache2-foreground