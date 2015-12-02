FROM ruby:2.2

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN env NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install -j5

COPY . /usr/src/app
