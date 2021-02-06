defmodule Buzzword.Bingo.Vue.Client.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Buzzword.Bingo.Vue.ClientWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Buzzword.Bingo.Vue.Client.PubSub},
      # Start the Endpoint (http/https)
      Buzzword.Bingo.Vue.ClientWeb.Endpoint
      # Start a worker by calling: Buzzword.Bingo.Vue.Client.Worker.start_link(arg)
      # {Buzzword.Bingo.Vue.Client.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Buzzword.Bingo.Vue.Client.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Buzzword.Bingo.Vue.ClientWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
