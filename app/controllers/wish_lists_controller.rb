class WishListsController < ApplicationController

  def index
    @wish_lists = current_user.wish_list
  end

  def new
    @wish_list = WishList.new
  end

  def show
    @wish_list = WishList.find(params[:id])
  end

  def create
    @wish_list = WishList.new(wish_list_params)
    @wish_list.user_id = current_user.id
    @wish_list.save
    redirect_to wish_lists_path
  end

  def destroy
  end

  private

  def wish_list_params
    params.require(:wish_list).permit(:title, :brand, :wish_list_image)
  end

end
