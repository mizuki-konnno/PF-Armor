class ClothesController < ApplicationController
  def index
    @clothes = current_user.clothes
  end

  def new
    @clothe = Clothe.new
    @genres = current_user.genres
  end

  def show
    @clethe = Clothe.find(params[:id])
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user_id = current_user.id
    @clothe.save
    redirect_to clothes_path
  end

  def destroy
  end

  private

  def clothe_params
    params.require(:clothe).permit(:title, :brand, :clothes_image, :caption)
  end

end
