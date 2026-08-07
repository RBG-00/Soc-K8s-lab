FROM ghcr.io/digininja/dvwa:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl gnupg2 ca-certificates lsb-release

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH \
    | gpg --dearmor -o /usr/share/keyrings/wazuh.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt stable main" \
    > /etc/apt/sources.list.d/wazuh.list

RUN apt-get update && \
    WAZUH_MANAGER=172.18.0.3 apt-get install -y wazuh-agent
# Apache logs to files instead of stdout/stderr
RUN rm -f /var/log/apache2/access.log \
    && rm -f /var/log/apache2/error.log \
    && touch /var/log/apache2/access.log \
    && touch /var/log/apache2/error.log \
    && chown www-data:www-data /var/log/apache2/access.log /var/log/apache2/error.log \
    && sed -i 's#/dev/stdout#/var/log/apache2/access.log#g' /etc/apache2/envvars \
    && sed -i 's#/dev/stderr#/var/log/apache2/error.log#g' /etc/apache2/envvars

COPY ossec.conf /var/ossec/etc/ossec.conf

# Enable Apache status module
RUN a2enmod status

# Configure server-status
RUN printf "ExtendedStatus On\n\n<Location /server-status>\n    SetHandler server-status\n    Require all granted\n</Location>\n" \
    > /etc/apache2/conf-available/server-status.conf

RUN a2enconf server-status

COPY start.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]