#!/bin/bash
set -e

echo "Starting database and redis..."
docker compose up -d db redis

echo "Waiting for database to be ready..."
until [ "$(docker compose ps --format json db | grep -o '"Health":"healthy"' || true)" ]; do
  echo "Database is unavailable or not healthy yet - sleeping"
  sleep 2
done

docker compose exec db psql --user=postgres --db=ccnet -c "GRANT ALL ON SCHEMA public TO seafile"
docker compose exec db psql --user=postgres --db=seafile -c "GRANT ALL ON SCHEMA public TO seafile"
docker compose exec db psql --user=postgres --db=seahub -c "GRANT ALL ON SCHEMA public TO seahub"

echo "Starting Seafile components..."
docker compose up -d seafile seahub

echo "Running migrations..."
docker compose exec seahub python3 manage.py migrate

echo "Creating superuser..."
docker compose exec seahub python3 manage.py createsuperuser

echo "Setup complete. Seahub is running at http://localhost:8000"
