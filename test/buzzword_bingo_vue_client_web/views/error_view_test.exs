defmodule Buzzword.Bingo.Vue.ClientWeb.ErrorViewTest do
  use Buzzword.Bingo.Vue.ClientWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  alias Buzzword.Bingo.Vue.ClientWeb.ErrorView

  test "renders 404.html" do
    assert render_to_string(ErrorView, "404.html", []) == "Page not found"
  end

  test "renders 500.html" do
    assert render_to_string(ErrorView, "500.html", []) ==
             "Internal server error"
  end

  test "renders any other" do
    assert render_to_string(ErrorView, "505.html", []) ==
             "Internal server error"
  end
end
