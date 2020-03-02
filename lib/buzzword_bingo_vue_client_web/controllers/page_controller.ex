defmodule Buzzword.Bingo.Vue.ClientWeb.PageController do
  use Buzzword.Bingo.Vue.ClientWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
