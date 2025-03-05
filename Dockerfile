FROM debian:latest

RUN apt update \
&& apt full-upgrade -y \
&& apt install transmission-daemon nano procps systemctl -y \
&& systemctl enable transmission-daemon

COPY setting.json /var/lib/transmission-daemon/info/settings.json
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh \
&& chown -R debian-transmission:debian-transmission /var/lib/transmission-daemon

EXPOSE 9091
VOLUME ["/var/lib/transmission-daemon"]

#CMD ["service", "transmission-daemon", "start"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["/bin/bash","/root/start.sh"]