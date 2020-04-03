FROM zhh1115/alpine:latest

ENV DOCKER_VOLUME_NETSHARE_VERSION 0.36

RUN apk add --no-cache wget nfs-utils && \
    wget -O /usr/bin/docker-volume-netshare https://github.com/ContainX/docker-volume-netshare/releases/download/v${DOCKER_VOLUME_NETSHARE_VERSION}/docker-volume-netshare_${DOCKER_VOLUME_NETSHARE_VERSION}_linux_amd64-bin && \
    chmod +x /usr/bin/docker-volume-netshare

ENTRYPOINT ["/usr/bin/docker-volume-netshare"]

CMD ["nfs"]
