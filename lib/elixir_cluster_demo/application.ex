defmodule ElixirClusterDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # start libcluster
      {Cluster.Supervisor, [topologies, [name: ElixirClusterDemo.ClusterSupervisor]]},
      # Start the endpoint when the application starts
      ElixirClusterDemoWeb.Endpoint
      # Starts a worker by calling: ElixirClusterDemo.Worker.start_link(arg)
      # {ElixirClusterDemo.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirClusterDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirClusterDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
