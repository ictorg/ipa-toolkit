# base stage
FROM ruby:3.0.1-alpine AS base
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

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN gem update --system

RUN if [ ${USER_ID} -ne 0 ] && [ ${GROUP_ID} -ne 0 ]; then \
  addgroup -S -g ${GROUP_ID} app && \
  adduser -D -H -h '/home/app' -S -s /bin/bash -g '' -u ${USER_ID} -G app app \
;fi

RUN chown -R ${USER_ID}:${GROUP_ID} /home/app /app /usr/local/bundle

USER $USER_ID:$GROUP_ID
WORKDIR /app

# build stage
FROM development AS build

ENV RAILS_ENV=production
ENV NODE_ENV=production

COPY --chown=app Gemfile* /app/
RUN bundle config --local frozen 1 && \
  bundle install -j4 --retry 3

COPY --chown=app . /app

# production stage
FROM base AS production

ENV RAILS_ENV=production
ENV NODE_ENV=production

RUN adduser -D app
RUN mkdir -p /app && chown -R app /app
USER app    
WORKDIR /app
COPY --chown=app --from=build /app /app

RUN gem install bundler:2.2.3
COPY --chown=app --from=build /usr/local/bundle /usr/local/bundle
RUN bundle config --local without 'development test' && \
  bundle install -j4 --retry 3 && \
  bundle clean --force

EXPOSE 3000
CMD ["bin/rails", "s",  "-p",  "3000", "-b", "0.0.0.0"]