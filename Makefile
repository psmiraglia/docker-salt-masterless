.PHONY: minion.d salt pillar

default: build

build: deb8 ubu14.04 ubu16.04 cos6 cos7

minion.d:
	cp -Rfv ./minion.d ./centos/6/conf/
	cp -Rfv ./minion.d ./centos/7/conf/
	cp -Rfv ./minion.d ./debian/8/conf/
	cp -Rfv ./minion.d ./ubuntu/14.04/conf/
	cp -Rfv ./minion.d ./ubuntu/16.04/conf/

salt:
	cp -Rfv ./salt ./centos/6/conf/
	cp -Rfv ./salt ./centos/7/conf/
	cp -Rfv ./salt ./debian/8/conf/
	cp -Rfv ./salt ./ubuntu/14.04/conf/
	cp -Rfv ./salt ./ubuntu/16.04/conf/

pillar:
	cp -Rfv ./pillar ./centos/6/conf/
	cp -Rfv ./pillar ./centos/7/conf/
	cp -Rfv ./pillar ./debian/8/conf
	cp -Rfv ./pillar ./ubuntu/14.04/conf/
	cp -Rfv ./pillar ./ubuntu/16.04/conf/

deb8: minion.d salt pillar
	docker build --tag salt-masterless:debian8 ./debian/8

ubu16.04: minion.d salt pillar
	docker build --tag salt-masterless:ubuntu16.04 ./ubuntu/16.04

ubu14.04: minion.d salt pillar
	docker build --tag salt-masterless:ubuntu14.04 ./ubuntu/14.04

cos6: minion.d salt pillar
	docker build --tag salt-masterless:centos6 ./centos/6

cos7: minion.d salt pillar
	docker build --tag salt-masterless:centos7 ./centos/7
