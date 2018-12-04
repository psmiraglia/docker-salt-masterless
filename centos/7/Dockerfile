FROM centos:7
MAINTAINER "Paolo Smiraglia <paolo.smiraglia@gmail.com>"

# install SaltStack
RUN yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm \
    && yum clean expire-cache \
    && yum install -y \
        git \
        salt-minion \
        vim

# add minion's configuration modules
ADD conf/minion.d/* /etc/salt/minion.d/

# add top level states
ADD conf/salt /srv/salt

# add top level pillar
ADD conf/pillar /srv/pillar

# create formulas' directory
RUN mkdir -p /srv/formulas

