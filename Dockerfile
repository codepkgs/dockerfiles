FROM zhh1115/alpine:latest

ENV GIT_URL https://gitee.com/mirrors/YApi.git
ENV YAPI_PORT 3000
ENV YAPI_CLOSE_REGISTER false
ENV YAPI_ADMIN_ACCOUNT admin@docker.yapi
ENV YAPI_VERSION_NOTIFY true
ENV YAPI_DB_SERVER_NAME yapi-mongo
ENV YAPI_DB_DATABASE yapi
ENV YAPI_DB_PORT 27017

RUN apk update && \
    apk add --no-cache git npm python2 python-dev py-pip make gcc && \
    pip install pymongo && \
    mkdir /yapi && \
    git clone ${GIT_URL} /yapi/vendors && \
    cd /yapi/vendors && \
    npm install --production --registry https://registry.npm.taobao.org

WORKDIR /yapi/vendors

COPY files/entrypoint.sh /entrypoint.sh
COPY files/config.json /yapi/config.json

RUN chmod +x /entrypoint.sh

EXPOSE 3000

CMD ["/entrypoint.sh"]
