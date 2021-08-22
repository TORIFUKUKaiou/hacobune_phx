bin="/app/bin/hacobune_phx"
# start the elixir application
eval "$bin eval \"HacobunePhx.Release.migrate\""
exec "$bin" "start"