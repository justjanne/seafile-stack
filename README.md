# Seafile Stack

Forked from Seafile 13.0

## Roadmap

- full support for postgres & mariadb
- production deployment docker-compose.yml and helm chart will follow
- CI for docker images
- Automated end-to-end tests

## Dev Environment

**Setup**

Run `./scripts/setup-dev.sh`. This will setup the docker stack and ask you to create a superuser.
You can access seafile on http://localhost:8000

**Stop**

`docker compose down`

**Start**

`docker compose up -d`

**Teardown**

`docker compose down -v`
