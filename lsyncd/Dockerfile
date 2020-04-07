FROM zhh1115/alpine:latest

RUN apk add --no-cache lsyncd openssh openssh-server

ENTRYPOINT ["lsyncd", "-nodaemon"]
