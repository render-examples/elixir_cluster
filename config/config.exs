# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :elixir_cluster_demo, ElixirClusterDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a8BaBpsM9V7mluSGJxUAVUBcsut8LgO0Hu1rXk8a/yt3QEc2A1GIkrxzQUHcuCzb",
  render_errors: [view: ElixirClusterDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirClusterDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
