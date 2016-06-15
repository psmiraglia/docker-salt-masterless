FROM centos:6
MAINTAINER "Paolo Smiraglia <paolo.smiraglia@gmail.com>"

RUN yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-1.el6.noarch.rpm \
    && yum clean expire-cache \
    && yum install -y \
        git \
        salt-minion \
        vim

ADD conf/minion.d/* /etc/salt/minion.d/
ADD states /srv/salt

RUN mkdir -p /opt/formulas
