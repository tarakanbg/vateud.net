class NewsController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
    @news = News.published
  end

  def show
    @pages = Page.main.visible.in_menu
  end
end
