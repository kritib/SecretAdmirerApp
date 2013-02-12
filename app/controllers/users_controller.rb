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
    @posts = @user.received_posts.order("created_at DESC")
  end

  def posts
    @posts = Post.where("poster_id = ?", params[:id]).order("created_at DESC")
  end
end
