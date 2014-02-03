class PagesController < ApplicationController
  def index
  end

  def show
    @pages = Page.main.visible.in_menu
    @page = Page.find(params[:id])
    if @page.slug == "home"
      @news = News.published.limit(3)
      @events = Event.future.limit(3)
      feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/VateudNewTasks")
      @tasks = feed.entries[0..2]
    end
  end

  def move_left
    if admin_user_signed_in? && current_admin_user.try(:page_editor?)
      page = Page.find(params[:id])
      page.move_left
      page.save
      redirect_to "/admin/pages/" + page.slug
    end
  end
  
  def move_right
    if admin_user_signed_in? && current_admin_user.try(:page_editor?)
      page = Page.find(params[:id])
      page.move_right
      page.save
      redirect_to "/admin/pages/" + page.slug
    end
  end

  def mercury_update
    if admin_user_signed_in? && current_admin_user.try(:page_editor?)
      page =Page.find(params[:id])
      #page.name = params[:content][:page_name][:value]
      page.post = params[:content][:page_content][:value]
      page.sidebar = params[:content][:page_sidebar][:value]
      page.save!
      render text: ""        
    end
  end
end
