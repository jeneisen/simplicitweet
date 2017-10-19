class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_access
    redirect_to root_path unless current_user
  end

  def error
    render status_code.to_s status: (params[:code] || 500)
  end
end
