FROM ruby:2.4
RUN apt-get update
RUN apt-get install -y nodejs
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
EXPOSE 3000
ENTRYPOINT ["./entry-point.sh"]
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
