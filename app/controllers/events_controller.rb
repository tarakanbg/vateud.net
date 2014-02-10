class EventsController < ApplicationController
  def index
    @pagetitle = "Events Calendar"
    @pages = Page.main.visible.in_menu
  end

  def show
    @pages = Page.main.visible.in_menu
  end
end
