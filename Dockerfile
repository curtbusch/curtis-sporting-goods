FROM ubuntu:trusty  # Using Ubuntu OS
MAINTAINER "Santosh Mohanty <santa.jyp@gmail.com>" # Maintainer Name
RUN apt-get update # Updating OS

ENV PATH /usr/local/rvm/bin:$PATH  # Set ENV Path

RUN apt-get update && apt-get -y upgrade && apt-get -y install ruby 1.9.3 # Installation of Ruby
RUN ln -sf /usr/bin/ruby1.9.3 /etc/alternatives/ruby

# basics
RUN apt-get install -y build-essential
RUN apt-get install -y mysql-client libmysqlclient-dev openssl libreadline6 
                       libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev
                       libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev
                       ncurses-dev automake libtool bison subversion pkg-  config gawk 
                       libgdbm-dev libffi-dev npm

RUN gem install bundler
ADD Gemfile /curtis_sporting_goods/Gemfile
ADD Gemfile.lock /curtis_sporting_goods/Gemfile.lock
WORKDIR /curtis_sporting_goods
RUN bundle install
ADD . /curtis_sporting_goods # Adds your Project Structure to docker
ENV ENVIRONMENT development
CMD ["rails","s"]

EXPOSE 8080 # Exposing PORT 8080 for Development