FROM ruby:2.6.5

ENV LANG C.UTF-8
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN npm i -g yarn

ENV APP_PATH /workspace
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

COPY . .

RUN gem update bundler
RUN bundle install --path vendor/bundle
RUN yarn
