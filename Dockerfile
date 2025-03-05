FROM debian:latest

RUN apt update \
&& apt full-upgrade -y \
&& apt install transmission-daemon nano procps systemctl -y \
&& mkdir -p /root/.config/transmission-daemon \
&& systemctl enable transmission-daemon

COPY setting.json /var/lib/transmission-daemon/info/settings.json
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh

EXPOSE 9091
VOLUME ["/var/lib/transmission-daemon"]

#CMD ["service", "transmission-daemon", "start"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["/bin/bash","/root/start.sh"]