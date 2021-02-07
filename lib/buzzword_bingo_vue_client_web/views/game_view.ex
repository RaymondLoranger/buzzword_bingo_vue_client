defmodule Buzzword.Bingo.Vue.ClientWeb.GameView do
  use Buzzword.Bingo.Vue.ClientWeb, :view

  def grid_glyph(size) do
    content_tag :div, class: "grid-glyph" do
      for _row <- 1..size do
        content_tag :div, class: "row" do
          for _col <- 1..size do
            content_tag(:span, "", class: "box")
          end
        end
      end
    end
  end
end
