class HomeController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
  end
end
