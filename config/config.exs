# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :elixir_cluster_demo, ElixirClusterDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a8BaBpsM9V7mluSGJxUAVUBcsut8LgO0Hu1rXk8a/yt3QEc2A1GIkrxzQUHcuCzb",
  render_errors: [view: ElixirClusterDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: ElixirClusterDemo.PubSub

config :esbuild,
  version: "0.20.0",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
