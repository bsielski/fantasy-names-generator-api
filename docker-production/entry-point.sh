#!/bin/bash -e
set -e

echo "FROM ENTRY POINT!"

if [[ -a /tmp/puma.pid ]]; then
  rm /tmp/puma.pid
fi

if [[ $RAILS_ENV == "production" ]]; then
  echo "FROM PRODUCTION!"
  bundle exec rails db:create
  bundle exec rails db:migrate
  bundle exec rails db:seed
fi

exec "$@"
