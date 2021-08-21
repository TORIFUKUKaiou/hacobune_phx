FROM elixir:1.12

ENV DEBIAN_FRONTEND=noninteractive

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.5.11 --force

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

ENV DEBIAN_FRONTEND=dialog

WORKDIR /app
EXPOSE 4000