FROM ruby:latest

ADD Gemfile /tmp/Gemfile

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y upgrade \
      && apt-get -y autoremove \
      && apt-get clean

RUN set -e \
      && gem update

RUN set -e \
      && cd /tmp \
      && bundle install --path=/usr/local/bundle

ENTRYPOINT ["/usr/local/bundle/bin/jekyll"]
