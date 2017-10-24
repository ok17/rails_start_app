FROM ruby:2.4.1
MAINTAINER ok17 <osamu.kashimura.17@gmail.com>

ENV LANG C.UTF-8

RUN apt-get update -qq \
        && apt-get install -y --no-install-recommends \
            openssh-server \
            build-essential \
            libmysqlclient-dev \
            nodejs \
            vim \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock  /app/Gemfile.lock

