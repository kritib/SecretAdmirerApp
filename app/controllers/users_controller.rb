class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user
      if log_in?(@user)
        redirect_to user_path(@user)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
