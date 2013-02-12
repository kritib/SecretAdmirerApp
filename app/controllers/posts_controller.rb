class PostsController < ApplicationController
  skip_before_filter :require_login, only: :index

  # Shows all posts
  def index
    @current_user = current_user
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])

    if @post
      flash[:notice] = "Posted!"
      redirect_to post_path(@post)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # shows all posts created by params[:id]
  def show
    @post = Post.find(params[:id])
    @posts = [@post]
    @comments = @post.comments.order("created_at DESC")
  end
end
