FROM ubuntu:16.04
LABEL maintainer="lonord.b@gmail.com"
COPY scripts/run.sh /run.sh
RUN chmod +x /run.sh \
	&& apt-get update \
	&& apt-get install -y samba \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "/run.sh" ]