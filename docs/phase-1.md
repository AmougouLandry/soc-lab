# Phase 1: Wazuh single-node
- Version pinned: v4.14.10 (official wazuh-docker, single-node)
- Dashboard bound to 127.0.0.1:8443
- Certificates generated locally (git-ignored)
- Verification: wazuh-control status, indexer curl on :9200, dashboard login

## Addendum
vulnerability-detection disabled in wazuh_manager.conf for this lab (no agents yet; the feed updates caused heavy RAM and disk writes). Verified after container recreate: manager RAM ~372 MiB, block I/O writes ~40 MB. Re-enable later by setting enabled to yes.
