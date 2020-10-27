FROM nginx:1.18

LABEL AUTHOR="zhanghe"
LABEL EMAIL="x_hezhang@126.com"

RUN groupadd -g 1000 www && \
    useradd -u 1000 -g 1000 www

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf
