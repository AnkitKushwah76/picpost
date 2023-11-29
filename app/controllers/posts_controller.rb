class PostsController < ApplicationController
  before_action :get_posts, only: %w[index my_posts]

  def index
    @pagy, @posts = pagy @posts.except_current_user(current_user.id)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "posts", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
    @post.save
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def my_posts
    @pagy, @posts = pagy_countless(@posts.by_user(current_user.id), items: 5)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "posts", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  private

  def get_posts
    @posts = Post.left_joins(:comments).group('posts.id').order('COUNT(comments.id) DESC')
  end

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end
