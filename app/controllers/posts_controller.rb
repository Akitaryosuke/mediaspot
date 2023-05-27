class PostsController < ApplicationController
  def new
    @post = Post.new
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
