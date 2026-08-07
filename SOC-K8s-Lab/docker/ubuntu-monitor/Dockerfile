FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    lsb-release \
    iputils-ping \
    dnsutils \
    net-tools \
    iproute2 \
    procps \
    ca-certificates \
    tar \
    openssh-server \
    rsyslog \
    sudo \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/sshd \
    && touch /var/log/auth.log \
    && chmod 640 /var/log/auth.log

# -----------------------------
# Install Node Exporter
# -----------------------------
WORKDIR /opt

RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz \
 && tar -xzf node_exporter-1.9.1.linux-amd64.tar.gz \
 && mv node_exporter-1.9.1.linux-amd64 node_exporter \
 && rm node_exporter-1.9.1.linux-amd64.tar.gz

# -----------------------------
# Install Wazuh Agent
# -----------------------------
RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --dearmor -o /usr/share/keyrings/wazuh.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt stable main" \
> /etc/apt/sources.list.d/wazuh.list

RUN apt-get update

RUN WAZUH_MANAGER="172.18.0.3" apt-get install -y wazuh-agent

# -----------------------------
# Copy configuration
# -----------------------------
COPY ossec.conf /var/ossec/etc/ossec.conf

# Debug: print the copied file during build
RUN echo "======================" \
 && echo "ossec.conf after COPY" \
 && echo "======================" \
 && cat /var/ossec/etc/ossec.conf \
 && echo "======================"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]