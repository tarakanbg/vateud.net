class NewsController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
  end

  def show
    @pages = Page.main.visible.in_menu
  end
end
