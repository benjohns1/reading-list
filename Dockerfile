# Based on: https://github.com/bitwalker/alpine-elixir-phoenix
FROM bitwalker/alpine-elixir-phoenix:latest
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
WORKDIR /opt/app
CMD ["mix", "phx.server"]