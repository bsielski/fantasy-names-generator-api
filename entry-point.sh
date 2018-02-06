#!/bin/sh
set -e
echo "ENTRYPOINT"

if [ "$CREATE_DB" != 0 ] && [ ! -z "$CREATE_DB" ]
then
  echo "CREATE_DB"
  rails db:create
fi

if [ "$MIGRATIONS" != 0 ] && [ ! -z "$MIGRATIONS" ]
then
  echo "MIGRATIONS"
  rails db:migrate
fi

if [ "$SEED" != 0 ] && [ ! -z "$SEED" ]
then
  echo "SEED"
  rails db:seed
fi

exec "$@"
