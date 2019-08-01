FROM centos:7

COPY pip.conf /root/.pip/pip.conf

RUN yum install -y wget gcc openssl-devel && \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
    yum install -y redis mariadb jq && \
    yum install -y curl wget nc bind-utils net-tools && \
    yum install -y python-pip python36 python36-pip python36-devel && \
    pip3 install ipython httpie mycli && \
    yum clean all 
