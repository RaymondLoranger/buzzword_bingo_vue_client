# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :buzzword_bingo_vue_client,
  namespace: Buzzword.Bingo.Vue.Client

# Configures the endpoint
config :buzzword_bingo_vue_client, Buzzword.Bingo.Vue.ClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "HYRniwlqiq9TOiJhvWIiq/POL6uTS9gmfIYDMiraQD/4iSJ5yfV8ufmdlIOBycmt",
  render_errors: [
    view: Buzzword.Bingo.Vue.ClientWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: Buzzword.Bingo.Vue.Client.PubSub,
  live_view: [signing_salt: "xbwxTxBw"],
  # Allows Windows command => set port=4040 && mix phx.server
  http: [
    port:
      (System.get_env("PORT") || "4000")
      |> String.trim()
      |> String.to_integer()
  ]

# Signing salt to sign messages between the server and the client...
config :buzzword_bingo_vue_client, salt: "player auth"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "config_logger.exs"
import_config "#{Mix.env()}.exs"
