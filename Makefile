.PHONY: build-dockerfile
build-dockerfile:
	docker build . --tag vsftpd:dockerfile

.PHONY: run
run:
	docker run \
		--detach \
		--env FTP_PASS=123 \
		--env FTP_USER=user \
		--env PUBLIC_IP=192.168.0.1 \
		--name my-ftp-server \
		--publish 20-21:20-21/tcp \
		--publish 40000-40009:40000-40009/tcp \
		--volume /data:/home/user \
		vsftpd:dockerfile
