# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :buzzword_bingo_vue_client,
  namespace: Buzzword.Bingo.Vue.Client

# Configures the endpoint
config :buzzword_bingo_vue_client, Buzzword.Bingo.Vue.ClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jdPkMB9IZEOvXKQgK859WQUjcwefoU+bMkiFzhtG1/XsQ8A4ckfeHyIQoe8uhbbS",
  render_errors: [view: Buzzword.Bingo.Vue.ClientWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Buzzword.Bingo.Vue.Client.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
