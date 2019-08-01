FROM alpine

RUN apk add --no-cache python3 && \
    pip3 install httpie

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
