docker-jekyll
=============

Dockerfile for Jekyll

Docker image
------------

Pull the image from [Docker Hub](https://hub.docker.com/r/dceoy/jekyll/).

```sh
$ docker pull dceoy/jekyll
```

Run a container

```sh
$ docker container run --rm -it -p 4000:4000 -v $(pwd):/work -w /work dceoy/jekyll -h
```
