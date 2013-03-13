class HomeController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
    @page = Page.where(:slug => "home").first
  end
end
