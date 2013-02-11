class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login


  def require_login
    unless logged_in?
      flash[:error] = "You need to log in!"
      redirect_to new_sessions_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    unless session[:token].nil?
      @current_user = User.find_by_session_token(session[:token])
    else
      nil
    end
  end

  def log_in?(user)
    if token = user.create_token
      session[:token] = token
      @current_user = user
    else
      flash[:error] = "Something went wrong"
      false
    end
  end


end
