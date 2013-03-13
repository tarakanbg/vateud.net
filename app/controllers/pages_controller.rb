class PagesController < ApplicationController
  def index
  end

  def show
    @pages = Page.main.visible.in_menu
    @page = Page.find(params[:id])
  end

  def move_left
    if admin_user_signed_in?
      page = Page.find(params[:id])
      page.move_left
      page.save
      redirect_to "/admin/pages/" + page.slug
    end
  end
  
  def move_right
    if admin_user_signed_in?
      page = Page.find(params[:id])
      page.move_right
      page.save
      redirect_to "/admin/pages/" + page.slug
    end
  end
end
