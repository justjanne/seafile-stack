#!/bin/bash
set -e

TARGET=$1

echo "Starting database and valkey..."
docker compose -f $TARGET.yml up -d db valkey

echo "Waiting for database to be ready..."
until [ "$(docker compose -f $TARGET.yml ps --format json db | grep -o '"Health":"healthy"' || true)" ]; do
  echo "Database is unavailable or not healthy yet - sleeping"
  sleep 2
done

echo "Running migrations..."
docker compose -f $TARGET.yml up migrations

echo "Starting Seafile components..."
docker compose -f $TARGET.yml up -d seafile seahub office fileserver notifications

echo "Running migrations..."
docker compose -f $TARGET.yml exec seahub python3 manage.py migrate

echo "Creating superuser..."
docker compose -f $TARGET.yml exec seahub python3 manage.py createsuperuser

echo "Setup complete. Seahub is running at http://localhost:8000"
