.PHONY: minion.d states

default: build

build: deb8 ubu14.04 ubu16.04 cos6 cos7

run:
	docker run -ti --rm salt-masterless

minion.d:
	cp -Rfv ./minion.d ./centos/6/conf/
	cp -Rfv ./minion.d ./centos/7/conf/
	cp -Rfv ./minion.d ./debian/8/conf/
	cp -Rfv ./minion.d ./ubuntu/14.04/conf/
	cp -Rfv ./minion.d ./ubuntu/16.04/conf/

states:
	cp -Rfv ./states ./centos/6/
	cp -Rfv ./states ./centos/7/
	cp -Rfv ./states ./debian/8/
	cp -Rfv ./states ./ubuntu/14.04/
	cp -Rfv ./states ./ubuntu/16.04/

deb8: minion.d states
	docker build --tag salt-masterless:debian8 ./debian/8

ubu16.04: minion.d states
	docker build --tag salt-masterless:ubuntu16.04 ./ubuntu/16.04

ubu14.04: minion.d states
	docker build --tag salt-masterless:ubuntu14.04 ./ubuntu/14.04

cos6: minion.d states
	docker build --tag salt-masterless:centos6 ./centos/6

cos7: minion.d states
	docker build --tag salt-masterless:centos7 ./centos/7
