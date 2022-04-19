FROM ruby:3.1.2-alpine as builder

RUN apk --update add postgresql-dev alpine-sdk tzdata libc6-compat

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

WORKDIR /app

RUN gem update bundler
RUN bundle config set --local without development test
RUN bundle

COPY . /app

RUN bundle binstubs --all
RUN SECRET_KEY_BASE=1 RAILS_ENV=production bin/rails assets:precompile
