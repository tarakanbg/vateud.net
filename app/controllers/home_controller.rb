class HomeController < ApplicationController
  def index
    @pages = Page.main.visible.in_menu
    @page = Page.where(:slug => "home").first
    @news = News.published.reorder("created_at DESC").limit(3)
    @events = Event.future.limit(3)
    feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/VateudNewTasks")
    @tasks = feed.entries[0..2]
    @pagetitle = "Welcome"
    # @images =
  end

  def help
    @pagetitle = "Documentation"
    @pages = Page.main.visible.in_menu
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:with_toc_data => true))
    @content = m.render(File.open(Rails.root + "HELP.md", 'r').read)
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
