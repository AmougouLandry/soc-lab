# Copies the custom rules into the running containers (the rules live in volumes, the repo is the source of truth)
docker cp D:\soc-lab\suricata\local.rules suricata:/var/lib/suricata/rules/local.rules
docker exec suricata chmod 644 /var/lib/suricata/rules/local.rules
docker exec suricata sh -c "grep -q '^  - local.rules' /etc/suricata/suricata.yaml || sed -i 's#^  - suricata.rules#  - suricata.rules\n  - local.rules#' /etc/suricata/suricata.yaml"
docker cp D:\soc-lab\wazuh\rules\soc_lab_rules.xml single-node-wazuh.manager-1:/var/ossec/etc/rules/soc_lab_rules.xml
docker exec single-node-wazuh.manager-1 sh -c "chown wazuh:wazuh /var/ossec/etc/rules/soc_lab_rules.xml && chmod 660 /var/ossec/etc/rules/soc_lab_rules.xml"