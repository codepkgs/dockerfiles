FROM zhh1115/alpine:3.12

COPY pip.conf /etc/pip.conf

RUN apk add --no-cache gcc musl-dev libffi-dev \
    bind-tools curl jq openssh-client openssl git rust \
    python3 python3-dev py3-pip openldap-clients \
    redis mariadb mariadb-client mariadb-dev postgresql-client

RUN pip3 install -U pip cryptography==3.2.1 requests==2.31 urllib3

RUN pip3 install mycli pgcli httpie ipython

RUN rm -rf /root/.cache/pip

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl
