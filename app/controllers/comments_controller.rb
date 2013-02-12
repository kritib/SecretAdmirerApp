class CommentsController < ApplicationController
  def new
    # @comment = Comment.new
    @post = Post.find(params[:post_id])
    @posts = [@post]
    @comment = @post.comments.build
  end

  def create
    @comment = Comment.create(params[:comment])

    if @comment
      flash[:notice] = "Comment added"
      redirect_to post_path(@comment.post_id)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
end
