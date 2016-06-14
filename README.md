# docker-salt-masterless

This Docker image installs and configures a masterless SaltStack.

The image includes a basic state (`webserver.sls`) that only installs Apache
web server.

To test the image, build it and run a Docker

    $ docker build -t salt-masterless .
    ...
    $ docker run -ti --rm salt-masterless

Then exec inside the Docker

    root@docker$ salt-call --local test.ping
    root@docker$ salt-call --local state.apply

To test your own states, add them under `/states` and rebuild the image.

    $ touch ./states/myownstate.sls
    ... edit your state ...
    $ docker build -t salt-masterless .
    $ docker run -ti --rm salt-masterless
    root@docker$ salt-call --local state.apply myownstate

References:

* [Salt Masterless Quickstart](https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html)
* [Install Docker Engine](https://docs.docker.com/engine/installation)
* [Build an image from a `Dockerfile`](https://docs.docker.com/engine/userguide/containers/dockerimages/#building-an-image-from-a-dockerfile)

