FROM elixir:latest AS local
WORKDIR /usr/src/app
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.7 --force
ENTRYPOINT ["tail", "-f", "/dev/null"]
