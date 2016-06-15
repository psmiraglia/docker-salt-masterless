FROM debian:8
MAINTAINER "Paolo Smiraglia <paolo.smiraglia@gmail.com>"

RUN apt-get update \
    && apt-get install -y -q \
        curl \
        git

ADD conf/saltstack.list /etc/apt/sources.list.d/saltstack.list
RUN curl https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - \
    && apt-get update \
    && apt-get install -y -q \
        salt-minion

ADD conf/minion /etc/salt/minion
ADD states /srv/salt

RUN mkdir -p /opt/formulas

