class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :posted_text, :sentence)
  end

end
