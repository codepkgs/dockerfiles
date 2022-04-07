FROM python:3.9-alpine

LABEL AUTHOR="zhangdaxian"
LABEL EMAIL="x_hezhang@126.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

COPY pip.conf /etc/pip.conf
