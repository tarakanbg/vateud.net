class NewsController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
    @news = News.published.reorder("created_at DESC")
    @news = @news.paginate(:page => params[:page], :per_page => 9)
    @pagetitle = "News"
  end

  def show
    @pages = Page.main.visible.in_menu
    @news = News.published.order("created_at DESC").limit(10)
    @news_post = News.find(params[:id])
    @pagetitle = "#{@news_post.title}"
  end

  def mercury_update
    if admin_user_signed_in? && current_admin_user.try(:page_editor?)
      page =News.find(params[:id])
      #page.name = params[:content][:page_name][:value]
      page.post = params[:content][:news_content][:value]
      page.save!
      render text: ""
    end
  end
end
