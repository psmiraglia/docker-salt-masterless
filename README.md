# docker-salt-masterless

This repository contains a set of Docker images that install and configure
a masterless SaltStack. Available Dockers are based on different
distributions:

* CentOS 6 ([`Dockerfile`](./centos/6/Dockerfile))
* CentOS 7 ([`Dockerfile`](./centos/6/Dockerfile))
* Ubuntu 14.04 ([`Dockerfile`](./ubuntu/14.04/Dockerfile))
* Ubuntu 16.04 ([`Dockerfile`](./ubuntu/16.04/Dockerfile))
* Debian 8 ([`Dockerfile`](./debian/8/Dockerfile))

## Building Docker images

To build all the images, you can use the `make`

    $ make
    ... take a 10 minutes rest ...

    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    salt-masterless     centos7             de366801c3de        8 minutes ago       423.7 MB
    salt-masterless     centos6             f15d3479bc6a        8 minutes ago       398.9 MB
    salt-masterless     ubuntu16.04         53d9bdf28b88        8 minutes ago       411.6 MB
    salt-masterless     ubuntu14.04         0e2646404daf        8 minutes ago       398.3 MB
    salt-masterless     debian8             89e6c1590125        8 minutes ago       359.3 MB
    ...

To test an image

    $ docker run -ti --rm salt-masterless:debian8
    root@53d9bdf28b88$ salt-call --local test.ping
    ...

    root@53d9bdf28b88$ salt-call --local state.show_sls
    ...

    root@53d9bdf28b88$ salt-call --local state.apply
    ...

## Adding and tesing custom Salt states

To test your own state, add it under [`states`](./states) and rebuild the
image(s).

    $ touch ./states/myownstate.sls
    ... edit your state ...

    $ make
    ... take a few minutes rest ...

    $ docker run -ti --rm salt-masterless:debian8
    root@53d9bdf28b88$ salt-call --local test.ping
    ...

    root@53d9bdf28b88$ salt-call --local state.show_sls myownstate
    ...

    root@53d9bdf28b88$ salt-call --local state.apply myownstate
    ...

## Updating Minion's configuration

To update the masterless Minion's configuration, add a `.conf` file in
[`minion.d`](./minion.d) and rebuild the image(s).

References:

* [Salt Masterless Quickstart](https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html)
* [Configuring the Salt Minion](https://docs.saltstack.com/en/latest/ref/configuration/minion.html)
* [Configuring the Salt Master](https://docs.saltstack.com/en/latest/ref/configuration/master.html)
* [Install Docker Engine](https://docs.docker.com/engine/installation)
* [Build an image from a `Dockerfile`](https://docs.docker.com/engine/userguide/containers/dockerimages/#building-an-image-from-a-dockerfile)

