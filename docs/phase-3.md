# Phase 3: Wazuh agent shipping eve.json and cowrie.json
- New compose project agent/ (container soc-agent, Wazuh agent 4.14.10 on Ubuntu 22.04)
- Joins network single-node_default, registers on wazuh.manager (agent name soc-sensor)
- Mounts honeylab_suricata_logs and honeylab_cowrie_logs read-only
- Log sources injected from agent/localfiles.xml at every start
- Verified: agent Active, wazuh-logtest decodes a Suricata alert and a Cowrie event
- Cowrie has no stock rules; custom rules come in phase 4
