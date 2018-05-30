FROM ruby:2.4.4

RUN apt-get update \
  && apt-get install -y nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .

ENV RAILS_ENV production
#RUN ["bundle", "exec", "rails", "assets:precompile"]

ENTRYPOINT ["./docker-production/entry-point.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-P", "/tmp/puma.pid"]