FROM ruby:2.4
RUN apt-get update
RUN apt-get install -y nodejs
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
