class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show

  end

private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :avater_image)
  end

end
