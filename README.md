## Dev setup with Docker
These steps will setup a [Phoenix 1.3](https://hexdocs.pm/phoenix/Phoenix.html) and [PostgreSQL](https://www.postgresql.org/) development environment via [Docker](https://www.docker.com/). This setup doesn't require a local installation of Postgres or the Phoenix stack for development. For best results on Windows, run your shell as administrator.

 1. Clone this repo and `cd` into the project directory
 1. Update `dev.env` with your prefered PostgreSQL configs.
 1. Create a persistent volume for your dev DB: `docker volume create --name postgres-volume`
 1. Start the Postgres container and open a shell into the Phoenix container to setup a new project: `docker-compose run --rm web sh`
 1. Create a new Phoenix app: `mix phx.new . --app phx_docker --no-brunch` (where `phx_docker` is the name of your new app), get and compile its dependencies. This will generate a new Phoenix app that is linked to your local `./app` directory.
 1. Change `./app/config/dev.exs` to use the container environment variables:
    ```elixir
    # Configure your database
    config :phx_docker, PhxDocker.Repo,
      adapter: Ecto.Adapters.Postgres,
      username: System.get_env("POSTGRES_USER"),
      password: System.get_env("POSTGRES_PASSWORD"),
      hostname: System.get_env("POSTGRES_HOST"),
      database: System.get_env("POSTGRES_DB_NAME"),
      pool_size: 10
    ```
  1. Create the DB: `mix ecto.create`
  1. Exit the shell: `exit`

## Starting and stopping
Once your local app is setup, you can easily start/stop your containers with:
  * `docker-compose up`
  * `docker-compose down`

### Your app should now be available on your host machine at `localhost:4000`

## Notes
 * On Windows there are problems with the automatic code reloading and brunch in Phoenix (due to complexities syncing code across the Windows/Linux filesystems).
 * The .dockerignore file is provided for convenience, if you want to containerize your app for staging and production environments moving forward.
 * This setup persists the PostgreSQL database using a Docker volume, and persists your application code on your local filesystem in the `./app` directory.

## Thanks!
To [bitwalker](https://github.com/bitwalker) for his excellent Phoenix Docker images