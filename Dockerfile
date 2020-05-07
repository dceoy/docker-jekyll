FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN set -e \
      && ln -sf bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
        g++ gcc make patch ruby-dev bundler zlib1g-dev \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && echo "source 'https://rubygems.org'" > /tmp/Gemfile \
      && echo "gem 'github-pages', group: :jekyll_plugins" >> /tmp/Gemfile \
      && bundle config set system 'true' \
      && bundle install --gemfile=/tmp/Gemfile

EXPOSE 4000

ENTRYPOINT ["/usr/local/bin/jekyll"]
