ARG DEBIAN_IMAGE=debian:stable-slim
ARG BASE=gcr.io/distroless/static-debian12:nonroot
FROM --platform=$BUILDPLATFORM ${DEBIAN_IMAGE} AS build
SHELL [ "/bin/sh", "-ec" ]

RUN export DEBCONF_NONINTERACTIVE_SEEN=true \
           DEBIAN_FRONTEND=noninteractive \
           DEBIAN_PRIORITY=critical \
           TERM=linux ; \
    apt-get -qq update ; \
    apt-get -yyqq upgrade ; \
    apt-get -yyqq install ca-certificates libcap2-bin; \
    apt-get clean

RUN apt-get install --yes --no-install-recommends \
    git make wget
RUN wget https://go.dev/dl/go1.21.13.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.13.linux-amd64.tar.gz
ENV PATH=/usr/local/go/bin:$PATH
RUN mkdir /workdir
RUN git clone --branch v1.12.1 --depth 1 https://github.com/coredns/coredns /workdir/coredns
RUN make -C /workdir/coredns
RUN cp --verbose /workdir/coredns/coredns /coredns

RUN setcap cap_net_bind_service=+ep /coredns

FROM --platform=$TARGETPLATFORM ${BASE}
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /coredns /coredns
USER nonroot:nonroot
WORKDIR /
EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]
