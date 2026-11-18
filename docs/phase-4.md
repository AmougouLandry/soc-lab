# Phase 4: Custom detection rules
- Suricata: suricata/local.rules (sid 9000001, Secure Shell client banner of common brute-force tools), registered in suricata.yaml
- Wazuh: wazuh/rules/soc_lab_rules.xml (100100 Suricata match, 100110/100111 Cowrie logins, 100130 correlation by src_ip)
- Deployment: scripts/deploy-rules.ps1 (rules live in container volumes, the repo is the source of truth)
- Verified: wazuh-logtest on real Cowrie lines, live banner test from the attacker container, alert 100100 received from agent soc-sensor
- Rule 100130 (correlation) is exercised in phase 6
