class RelationshipsController < ApplicationController

  def create
    # 非同期化の為、追記と削除
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    # redirect_to request.referer
  end

  def destroy
    # 非同期化の為、追記と削除
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    # redirect_to request.referer
  end

　# フォロー一覧表示の為
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

end
