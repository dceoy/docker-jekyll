FROM ruby:latest

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && echo "source 'https://rubygems.org'" > /tmp/Gemfile \
      && echo "gem 'github-pages', group: :jekyll_plugins" >> /tmp/Gemfile \
      && cd /tmp \
      && gem update \
      && bundle install --path=/usr/local/bundle

ENTRYPOINT ["/usr/local/bundle/bin/jekyll"]
