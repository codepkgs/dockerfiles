FROM zhh1115/alpine:3.12

COPY pip.conf /etc/pip.conf

RUN apk add --no-cache gcc musl-dev libffi-dev \
    bind-tools curl jq openssh-client openssl \
    python3 python3-dev py3-pip \
    mariadb mariadb-client mariadb-dev \
    redis

RUN pip3 install mycli httpie \
    ipython requests \
    dingdingrobot wechatrobot

RUN rm -rf /root/.cache/pip

