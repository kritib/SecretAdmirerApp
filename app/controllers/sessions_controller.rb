class SessionsController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def new
    @login_page = true
  end


  def create
    user = User.find_by_username(params[:username])
    if user
      if log_in?(user)
        redirect_to user_path(user)
      else
        render 'new'
      end

    else
      flash[:error] = "Invalid username"
      render 'new'
    end
  end

  def destroy
    @current_user.delete_token
    session[:token] = nil
    @current_user = nil
    redirect_to root_path
  end
end
