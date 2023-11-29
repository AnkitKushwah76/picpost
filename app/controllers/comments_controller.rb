class CommentsController < ApplicationController
  before_action :get_post

  def new
    @comment = @post.comments.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment  = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path }
        format.js { render :create }
      else
        format.html { render :new }
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js { render :destroy }
    end
  end  

  private
  def get_post
    @post = Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
