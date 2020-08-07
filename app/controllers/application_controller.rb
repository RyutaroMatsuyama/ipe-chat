class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :partner
  before_action :login_required

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def partner
    @partner ||= User.find(session[:partner_id]) if session[:partner_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
