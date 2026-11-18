#!/bin/bash
set -e
MANAGER="${WAZUH_MANAGER:-wazuh.manager}"
NAME="${WAZUH_AGENT_NAME:-soc-sensor}"
CONF=/var/ossec/etc/ossec.conf

sed -i "s#<address>.*</address>#<address>${MANAGER}</address>#" "$CONF"

# Re-inject the lab log sources on every start (idempotent)
sed -i '/<!-- SOC-LAB BEGIN -->/,/<!-- SOC-LAB END -->/d' "$CONF"
cat /config/localfiles.xml >> "$CONF"

# Register once; the key is kept in the agent_etc volume
if [ ! -s /var/ossec/etc/client.keys ]; then
  until /var/ossec/bin/agent-auth -m "$MANAGER" -A "$NAME"; do
    echo "registration failed, retrying in 5 s"; sleep 5
  done
fi

/var/ossec/bin/wazuh-control start
exec tail -F /var/ossec/logs/ossec.log
