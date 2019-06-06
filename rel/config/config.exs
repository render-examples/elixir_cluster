use Mix.Config

port = String.to_integer(System.get_env("PORT") || "4000")
default_secret_key_base = :crypto.strong_rand_bytes(43) |> Base.encode64

config :elixir_cluster_demo, ElixirClusterDemoWeb.Endpoint,
  http: [port: port],
  url: [host: "localhost", port: port],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || default_secret_key_base

dns_name = System.get_env("RENDER_DISCOVERY_SERVICE")
app_name = System.get_env("RENDER_SERVICE_NAME")
config :libcluster, topologies: [
  distillery: [
    strategy: Cluster.Strategy.Kubernetes.DNS,
    config: [
      service: dns_name,
      application_name: app_name
    ]
  ]
]
