FROM ubuntu:22.04
ARG WAZUH_VERSION=4.14.10-1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates procps \
 && curl -fsSL -o /tmp/wazuh-agent.deb "https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_${WAZUH_VERSION}_amd64.deb" \
 && apt-get install -y /tmp/wazuh-agent.deb \
 && rm -rf /tmp/wazuh-agent.deb /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
