class WishListsController < ApplicationController

  # gemのkaminari使用のために追記
  def index
    @wish_lists = current_user.wish_list.page(params[:page]).per(18)
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
    # バリデーションの為、if文追加
    if @wish_list.save
    redirect_to wish_lists_path
    else
    flash.now[:danger] = '画像を選択して下さい。'
    render :new
    end
  end

  def destroy
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy
    redirect_to wish_lists_path
  end

  private

  def wish_list_params
    params.require(:wish_list).permit(:title, :brand, :wish_list_image)
  end

end
