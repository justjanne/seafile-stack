#!/bin/bash
set -e

echo "Starting database and valkey..."
docker compose up -d db valkey

echo "Waiting for database to be ready..."
until [ "$(docker compose ps --format json db | grep -o '"Health":"healthy"' || true)" ]; do
  echo "Database is unavailable or not healthy yet - sleeping"
  sleep 2
done

echo "Starting Seafile components..."
docker compose up -d seafile seahub office fileserver notifications

echo "Running migrations..."
docker compose exec seahub python3 manage.py migrate

echo "Creating superuser..."
docker compose exec seahub python3 manage.py createsuperuser

echo "Setup complete. Seahub is running at http://localhost:8000"
