class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end
  
  def upload
    @user = User.new(user_params)
    @user.save!
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :avater_image, :avater_image_x, :avater_image_y, :avater_image_w, :avater_image_h)
  end

end
