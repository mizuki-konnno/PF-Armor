class UsersController < ApplicationController
      before_action :correct_user,only: [:edit]

  # gem kaminariの使用にために追記
  def index
    @users = User.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :height, :introduction, :profile_image)
  end


  # urlの直打ち禁止するため
  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

end
