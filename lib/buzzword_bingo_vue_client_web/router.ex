defmodule Buzzword.Bingo.Vue.ClientWeb.Router do
  use Buzzword.Bingo.Vue.ClientWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Buzzword.Bingo.Vue.ClientWeb do
    pipe_through :browser

    get "/", GameController, :new

    resources "/games", GameController, only: [:new, :create, :show]

    resources "/sessions", SessionController,
      only: [:new, :create, :delete],
      singleton: true
  end
end
