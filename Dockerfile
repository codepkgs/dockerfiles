FROM zhh1115/alpine:3.12

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
