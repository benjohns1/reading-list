# Reading List
Simple Phoenix app that manages a personal list of books and reading material.
## Windows dev setup
1. Install [Elixir](https://elixir-lang.org/) and [PostgreSQL](https://www.postgresql.org/) locally
1. Clone this repo and `cd` into the `app` directory
1. Update `..\dev.env` with your prefered PostgreSQL configs and run `..\win-env.bat ..\dev.env` to set current dev environment variables for the current console session
1. Get/compile dependencies: `mix deps.get` and `mix deps.compile`
1. Create/migrate the DB: `mix ecto.create` and `mix ecto.migrate`
1. Run the Phoenix server: `mix phx.server`

## Dev setup with Docker
These steps will setup a [Phoenix 1.3](https://hexdocs.pm/phoenix/Phoenix.html) and [PostgreSQL](https://www.postgresql.org/) development environment via [Docker](https://www.docker.com/). This setup doesn't require a local installation of Postgres or the Phoenix stack for development. If using Docker for Windows, run your shell as administrator for best results; however, due to filesystem sync problems, it is not recommended to use this setup on a Windows machine.

1. Clone this repo and `cd` into the project directory
1. Update `dev.env` with your prefered PostgreSQL configs
1. Create a persistent volume for your dev DB: `docker volume create --name postgres-volume`
1. Start the Postgres container and open a shell into the Phoenix container to setup a new project: `docker-compose run --rm web sh`
1. Get/compile dependencies: `mix deps.get` and `mix deps.compile`
1. Create/migrate the DB: `mix ecto.create` and `mix ecto.migrate`
1. Exit the shell: `exit`

### Starting and stopping
Once your local app is setup via Docker, you can easily start/stop your containers with:
  * `docker-compose up`
  * `docker-compose down`

## App hosted at `localhost:4000`