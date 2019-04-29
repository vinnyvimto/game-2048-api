FROM elixir:1.8.1-alpine

LABEL maintainer="Luke Vincent <luke.k.vincent@gmail.com>"

WORKDIR /opt/game-2048-api

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.* ./

RUN mix deps.get

COPY config ./config
COPY lib ./lib
COPY priv ./priv

# Set to mysql docker service
RUN sed -i "s/localhost/mysql/" config/test.exs config/dev.exs

RUN mix compile

CMD mix run --no-halt
