class HomesController < ApplicationController
  def top
    @posts = Post.all
    @users = User.all
    @user = User.find_by(params[:user_id])
  end
end
