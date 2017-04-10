class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def home
  end

  def page_not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
