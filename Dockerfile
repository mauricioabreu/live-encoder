FROM ruby:3.1.2-alpine3.16

RUN apk update && apk add --no-cache nodejs \
    build-base \
    git \
    sqlite \
    sqlite-dev \
    gcompat \
    tzdata

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

WORKDIR /app
COPY Gemfile /app
COPY Gemfile.lock /app
RUN gem update --system && gem update bundle
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]