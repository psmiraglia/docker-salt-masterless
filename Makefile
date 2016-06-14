default: build run

build:
	 docker build -t salt-masterless .

run:
	docker run -ti --rm salt-masterless
