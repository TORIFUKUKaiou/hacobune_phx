# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hacobune_phx,
  ecto_repos: [HacobunePhx.Repo]

# Configures the endpoint
config :hacobune_phx, HacobunePhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q7GDEFhqam790vNBP8tQW7TATk6n1QnCXgag7orioCao6IufeHCRCLzuSI40mxzh",
  render_errors: [view: HacobunePhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HacobunePhx.PubSub,
  live_view: [signing_salt: "vsrTiTvU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
