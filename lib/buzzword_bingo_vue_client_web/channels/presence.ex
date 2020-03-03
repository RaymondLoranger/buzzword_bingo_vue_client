defmodule Buzzword.Bingo.Vue.ClientWeb.Presence do
  @dialyzer {:nowarn_function, init: 1}
  use Phoenix.Presence,
    otp_app: :buzzword_bingo_vue_client,
    pubsub_server: Buzzword.Bingo.Vue.Client.PubSub
end
