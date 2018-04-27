FROM debian:stretch
LABEL maintainer="lonord.b@gmail.com"
COPY packages/samba-4.8.1.tar.gz /root/samba.tar.gz
COPY packages/gnutils-3.5.18.tar.xz /root/gnutils.tar.xz
COPY packages/nettle-3.1.tar.gz /root/nettle.tar.gz
COPY packages/gmp-6.1.2.tar.lz /root/gmp.tar.lz
COPY scripts/run.sh /run.sh
RUN chmod +x /run.sh \
	&& apt-get update \
	&& apt-get install -y gcc g++ make python python-dev lzip m4 autogen pkg-config libacl1-dev libldap2-dev libpam-dev procps \
	&& cd /root \
	&& tar -zxf samba.tar.gz \
	&& tar -Jxf gnutils.tar.xz \
	&& tar -zxf nettle.tar.gz \
	&& tar --lzip -xf gmp.tar.lz \
	&& cd /root/nettle-3.1 && ./configure && make && make install \
	&& cd /root/gmp-6.1.2 && ./configure && make && make install \
	&& cd /root/gnutls-3.5.18 && ./configure --with-included-libtasn1 --with-included-unistring --without-p11-kit && make && make install \
	&& cd /root/samba-4.8.1 && ./configure && make && make install \
	&& cd /root/samba-4.8.1/packaging/Example && tar -xf skeleton.tar && cd usr/local/samba/lib && cp smb.conf /usr/local/samba/etc/ && mkdir /var/log/samba \
	&& cd /root/ && rm -rf * \
	&& apt-get remove gcc g++ make python python-dev lzip m4 autogen pkg-config libacl1-dev libldap2-dev libpam-dev -y && apt autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "/run.sh" ]