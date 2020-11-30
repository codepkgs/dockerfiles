FROM zhh1115/alpine:3.12

COPY pip.conf /etc/pip.conf

RUN apk add --no-cache gcc musl-dev libffi-dev \
    bind-tools curl jq openssh-client openssl git \
    python3 python3-dev py3-pip \
    redis mariadb mariadb-client mariadb-dev

RUN pip3 install mycli httpie \
    ipython requests \
    dingdingrobot wechatrobot

RUN rm -rf /root/.cache/pip

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl
