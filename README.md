

# Reading List
Simple Phoenix app that manages a personal list of books and reading material.
## First-time dev setup with Docker
These steps will setup a [Phoenix 1.3](https://hexdocs.pm/phoenix/Phoenix.html) and [PostgreSQL](https://www.postgresql.org/) development environment via [Docker](https://www.docker.com/). This setup doesn't require a local installation of Postgres or the Phoenix stack for development. For best results on Windows, run your shell as administrator.

1. Clone this repo and `cd` into the project directory
1. Update `dev.env` with your prefered PostgreSQL configs.
1. Create a persistent volume for your dev DB: `docker volume create --name postgres-volume`
1. Start the Postgres container and open a shell into the Phoenix container to setup a new project: `docker-compose run --rm web sh`
1. Create the DB: `mix ecto.create`
1. Exit the shell: `exit`

## Starting and stopping
Once your local app is setup, you can easily start/stop your containers with:
  * `docker-compose up`
  * `docker-compose down`

### Your app should now be available on your host machine at `localhost:4000`