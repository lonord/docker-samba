FROM ubuntu:16.04
LABEL maintainer="lonord.b@gmail.com"
COPY scripts/start.sh /start.sh
COPY scripts/stop.sh /stop.sh
COPY bin /tmp_bin
RUN chmod +x /*.sh \
	&& cp /tmp_bin/$(arch)/docker-init /docker-init && rm -rf /tmp_bin \
	&& apt-get update \
	&& apt-get install -y samba \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "/docker-init", "/start.sh", "/stop.sh" ]