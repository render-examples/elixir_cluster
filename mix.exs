defmodule ElixirClusterDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_cluster_demo,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ElixirClusterDemo.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp aliases do
    [
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.0"},
      {:phoenix_pubsub, "~> 2.1.3"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_view, "~> 2.0"},
      {:phoenix_live_view, "~> 0.18.18"},
      {:phoenix_live_dashboard, "~> 0.7.2"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0.0"},
      {:telemetry, "~> 1.2.1"},
      {:phoenix_live_reload, "~> 1.4.1", only: :dev},
      {:gettext, "~> 0.24.0"},
      {:jason, "~> 1.4.1"},
      {:plug_cowboy, "~> 2.7.0"},
      {:libcluster, "~> 3.3.3"},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev}
    ]
  end
end
