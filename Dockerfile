FROM centos:7.6.1810

LABEL AUTHOR="zhanghe"
LABEL EMAIL="x_hezhang@126.com"

COPY files/epel.repo /etc/yum.repos.d/epel.repo
COPY files/remi.repo /etc/yum.repos.d/remi.repo

# 工作目录(代码所在目录)
WORKDIR /app

# 设置时区
RUN ln -nsf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 创建用户
RUN groupadd -g 1000 www && \
    useradd -u 1000 -g 1000 www

# 安装 PHP
RUN yum clean all && \
    yum makecache && \
    yum install -y gcc gcc-c++ openssl openssl-devel \
                libtool autoconf automake unzip git \
                zip zlib zlib-devel pcre pcre-devel \
                mhash mhash-devel gd gd-devel && \
    yum install -y php74 php74-php php74-runtime \
                php74-php-bcmath php74-php-cli php74-php-common php74-php-devel \
                php74-php-fpm php74-php-gd php74-php-intl php74-php-json \
                php74-php-mbstring php74-php-mysqlnd php74-php-opcache \
                php74-php-pdo php74-php-soap php74-php-xml php74-php-xmlrpc \
                php74-php-dba php74-php-enchant php74-php-gmp php74-php-imap \
                php74-php-json php74-php-ldap php74-php-odbc php74-php-pdo-dblib \
                php74-php-pgsql php74-php-pspell php74-php-sodium php74-php-tidy \
                php74-php-lz4 php74-php-process php74-php-pecl-crypto \
                php74-php-pecl-decimal php74-php-pecl-http-devel \
                php74-php-pecl-http php74-php-pecl-imagick \
                php74-php-pecl-imagick-devel php74-php-pecl-mcrypt \
                php74-php-pecl-mysql php74-php-pecl-oauth php74-php-pecl-redis5 \
                php74-php-pecl-seaslog php74-php-pecl-swoole4 php74-php-phalcon4 \
                php74-php-pecl-apcu php74-php-pecl-geoip php74-php-pecl-memcached \
                php74-php-pecl-mongodb php74-php-pecl-zip php74-php-pecl-recode \
                php74-php-pecl-grpc php74-php-pecl-protobuf && \
    ln -nsf /opt/remi/php74/root/usr/bin/php /usr/bin/php && \
    ln -nsf /opt/remi/php74/root/usr/sbin/php-fpm /usr/bin/php-fpm && \
    yum clean all && \
    rm -rf /var/cache/yum

# 安装并配置 composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 创建目录
RUN mkdir -p /data/logs/php-seaslog && \
    chown -R www:www /data/logs/php-seaslog

# PHP 配置
COPY files/php/php.ini /etc/opt/remi/php74/php.ini
COPY files/php/php-fpm.conf /etc/opt/remi/php74/php-fpm.conf
COPY files/php/www.conf /etc/opt/remi/php74/php-fpm.d/www.conf
COPY files/php/40-seaslog.ini /etc/opt/remi/php74/php.d/40-seaslog.ini

EXPOSE 9000

CMD ["/usr/bin/php-fpm", "--nodaemonize"]

