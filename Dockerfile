# base stage
FROM ruby:3.0.4-alpine AS base
RUN apk add --no-cache --update \
  postgresql-dev \
  tzdata \
  imagemagick \
  file

# development stage
FROM base AS development
RUN apk add --no-cache --update \
  build-base \
  linux-headers \
  git \
  bash

RUN gem update --system

WORKDIR /app

# build stage
FROM development AS build

ENV RAILS_ENV=production
ENV NODE_ENV=production

COPY Gemfile* /app/
RUN bundle config --local frozen 1 && bundle install -j4 --retry 3

COPY . /app

# production stage
FROM base AS production

ENV RAILS_ENV=production
ENV NODE_ENV=production

RUN adduser -D app
RUN mkdir -p /app && chown -R app /app
USER app
WORKDIR /app
COPY --chown=app --from=build /app /app

RUN gem install bundler:2.3.3
COPY --chown=app --from=build /usr/local/bundle /usr/local/bundle
RUN bundle config --local without 'development test' && \
  bundle install -j4 --retry 3 && \
  bundle clean --force

EXPOSE 80
CMD ["bin/rails", "s",  "-p",  "80", "-b", "0.0.0.0"]