module ApplicationHelper

  def home_slider
    render :partial => "slider" if @page && @page.slug == "home"
  end

  def adminbar
    render :partial => "adminbar" if admin_user_signed_in?
  end

  def footer
    if @page && @page.slug == "home"
      render :partial => "footer_home"
    else
      render :partial => "footer"
    end
  end

end
