FROM elixir:latest AS local
WORKDIR /usr/src/app
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.7 --force



# COPY mix.exs .
# COPY mix.lock .
# ENTRYPOINT ["mix", "phx.server"]
CMD mix phx.server


# ENTRYPOINT ["tail", "-f", "/dev/null"]
