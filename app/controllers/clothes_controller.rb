class ClothesController < ApplicationController

  # gem kaminari使用のため追記
  def index
    @clothes = current_user.clothes.page(params[:page]).per(18)
  end

  def new
    @clothe = Clothe.new
    # 登録時にジャンルが必要なため
    @genres = current_user.genres
  end

  def show
    @clothe = Clothe.find(params[:id])
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user_id = current_user.id
    @clothe.save
    redirect_to clothes_path
  end

  def destroy
    @clothe = Clothe.find(params[:id])
    @clothe.destroy
    redirect_to clothes_path
  end

  private

  def clothe_params
    params.require(:clothe).permit(:title, :brand, :clothes_image, :caption, :genre_id)
  end

end
