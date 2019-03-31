FROM ruby:2.6.1-alpine

RUN apk add --update \
  && apk add build-base libxml2-dev libxslt-dev udev sqlite sqlite-dev nodejs nodejs-npm tzdata \
  && apk upgrade --available \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/app

COPY Gemfile* /usr/app/

RUN gem install bundler:2.0.1
RUN gem install sqlite3:1.3.13
RUN bundle config build.nokogiri --use-system-libraries && \
  bundle install

COPY . /usr/app/

EXPOSE 3000

ENTRYPOINT bundle exec rails s -p 3000

