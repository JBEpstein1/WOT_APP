#!/bin/bash
# docker-scripts/rails.sh

# Wait for Postgres to become available.
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "postgres" -c '\q'; do
  sleep 1
done

# Then run the Rails server
rm -f tmp/pids/server.pid && bin/rails server -p 3000 -b 0.0.0.0
