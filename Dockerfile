FROM debian:latest

RUN apt update \
&& apt full-upgrade -y \
&& apt install transmission-daemon nano procps -y \
&& mkdir -p /root/.config/transmission-daemon

COPY setting.json /root/.config/transmission-daemon/settings.json

EXPOSE 9091
VOLUME ["/root/.config/transmission-daemon"]

ENTRYPOINT ["transmission-daemon", "-f", "--log-error"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]