defmodule Buzzword.Bingo.Vue.ClientWeb.Presence do
  @moduledoc """
  Provides presence tracking to channels and processes.

  See the [`Phoenix.Presence`](http://hexdocs.pm/phoenix/Phoenix.Presence.html)
  docs for more details.
  """
  use Phoenix.Presence,
    otp_app: :buzzword_bingo_vue_client,
    pubsub_server: Buzzword.Bingo.Vue.Client.PubSub
end
