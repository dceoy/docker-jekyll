docker-jekyll
=============

Dockerfile for Jekyll with GitHub Pages

Docker image
------------

Pull the image from [Docker Hub](https://hub.docker.com/r/dceoy/jekyll/).

```sh
$ docker pull dceoy/jekyll
```

Usage
-----

Run a web server

```sh
$ docker container run --rm -it -p 4000:4000 -v ${PWD}:/work -w /work \
    dceoy/jekyll serve --host=0.0.0.0 --drafts --watch
```

Run a web server with docker-compose

```sh
$ docker-compose -f /path/to/docker-jekyll/docker-compose.yml up
```

Update Gemfile.lock

```sh
$ docker-compose run --rm --entrypoint=bundle jekyll update
```
