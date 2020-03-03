defmodule Buzzword.Bingo.Vue.Client.Mixfile do
  use Mix.Project

  def project do
    [
      app: :buzzword_bingo_vue_client,
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Buzzword.Bingo.Vue.Client.Application, []},
      extra_applications: [:logger, :runtime_tools]
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
      {:mix_tasks,
       github: "RaymondLoranger/mix_tasks", only: :dev, runtime: false},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 1.0"},
      # {:cowboy, "~> 1.0"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:bingo, path: "../bingo"}

      # {:bingo, "~> 1.0"}
      # {:bingo, git: "https://github.com/username/bingo.git"}
      # {:bingo, git: "git@github.com:username/bingo.git"}
      # {:bingo, in_umbrella: true}
    ]
  end
end
