FROM python:3.6-alpine

WORKDIR /jupyter

COPY pip.conf /root/.pip/pip.conf

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

RUN apk add --no-cache gcc g++ libzmq linux-headers tini && \
    pip install jupyter && \
    rm -rf ~/.cache/pip


ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--allow-root", "--no-browser", "--ip=0.0.0.0"]

