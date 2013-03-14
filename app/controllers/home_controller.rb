class HomeController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
    @page = Page.where(:slug => "home").first
  end

  # def mercury_update
  #   if admin_user_signed_in?
  #     page =Page.find(params[:id])
  #     #page.name = params[:content][:page_name][:value]
  #     page.post = params[:content][:page_content][:value]
  #     page.save!
  #     render text: ""        
  #   end
  # end
  
end
