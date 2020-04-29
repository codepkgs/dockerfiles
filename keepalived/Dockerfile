FROM zhh1115/alpine:latest

LABEL author=zhanghe email=x_hezhang@126.com

ENV KEEPALIVED_VERSION=2.0.20

WORKDIR /usr/local/keepalived

ADD https://github.com/acassen/keepalived/archive/v${KEEPALIVED_VERSION}.tar.gz .

RUN addgroup -S keepalived_script && adduser -D -S -G keepalived_script keepalived_script

RUN apk add --no-cache gcc ipset ipset-dev iptables iptables-dev libnfnetlink libnfnetlink-dev libnl3 libnl3-dev libnftnl-dev make musl-dev openssl openssl-dev autoconf automake && \
    tar zxf v${KEEPALIVED_VERSION}.tar.gz && \
    cd keepalived-${KEEPALIVED_VERSION} && \
    ./build_setup && \
    ./configure --prefix=/usr/local/keepalived --disable-dynamic-linking --enable-bfd && \
    make && \
    make install && \
    rm -rf keepalived-${KEEPALIVED_VERSION} v${KEEPALIVED_VERSION}.tar.gz

ENTRYPOINT ["/usr/local/keepalived/sbin/keepalived","--dont-fork","--log-console", "-f","/usr/local/keepalived/etc/keepalived.conf"]
