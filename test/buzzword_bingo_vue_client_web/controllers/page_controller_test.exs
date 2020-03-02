defmodule Buzzword.Bingo.Vue.ClientWeb.PageControllerTest do
  use Buzzword.Bingo.Vue.ClientWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
