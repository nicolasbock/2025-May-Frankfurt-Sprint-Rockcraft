FROM ubuntu:noble

ENV FTP_USER=foo
ENV	FTP_PASS=bar
ENV	GID=1000
ENV	UID=1000
ENV	PUBLIC_IP=0.0.0.0

RUN apt-get update
RUN apt-get install --no-install-recommends --yes vsftpd

COPY [ "vsftpd.conf", "/etc" ]
COPY [ "docker-entrypoint.sh", "/" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "/usr/sbin/vsftpd" ]

EXPOSE 20/tcp 21/tcp 40000-40009/tcp
HEALTHCHECK CMD netstat -lnt | grep :21 || exit 1
