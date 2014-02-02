class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'active_admin_views_pages_base.rb'

private

  def authenticate_admin_user!
    raise SecurityError unless current_admin_user.try(:page_editor?)
  end
  
  rescue_from SecurityError do |exception|
    redirect_to root_url
  end

  def after_sign_in_path_for(admin_user)
    root_path
  end



  
end
