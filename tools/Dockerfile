FROM centos:7

COPY files/pip.conf /root/.pip/pip.conf

COPY files/pyenv-installer /root/pyenv-installer

ENV LANG en_US.UTF-8

RUN yum install -y wget gcc openssl-devel git vim && \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
    yum install -y redis mariadb jq && \
    yum install -y curl wget nc bind-utils net-tools && \
    yum install -y python-pip python36 python36-pip python36-devel && \
    pip3 install ipython httpie mycli && \
    yum clean all 

RUN /bin/bash /root/pyenv-installer && \
	echo 'export PATH="/root/.pyenv/bin:$PATH"' >> /root/.bashrc && \
	echo 'eval "$(pyenv init -)"' >> /root/.bashrc && \
	echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

