class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :redirect
  
  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
      @current_user ||= User.find_by(session_token: session[:session_token])
  end
  def redirect
    if current_user
      redirect_to cats_url
    end
  end
end
