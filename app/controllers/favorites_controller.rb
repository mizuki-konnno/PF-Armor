class FavoritesController < ApplicationController
  def create
    # 非同期化の為、追記と削除
    @corde = Corde.find(params[:corde_id])
    favorite = current_user.favorites.new(corde_id: @corde.id)
    favorite.save
    # redirect_to corde_path(corde)
  end

  def destroy
    # 非同期化の為、追記と削除
    @corde = Corde.find(params[:corde_id])
    favorite = current_user.favorites.find_by(corde_id: @corde.id)
    favorite.destroy
    # redirect_to corde_path(corde)
  end
end
