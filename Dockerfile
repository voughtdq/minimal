FROM elixir:1.15.4
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN mix local.hex --force
RUN mix do compile
CMD ["iex", "-S", "mix"]