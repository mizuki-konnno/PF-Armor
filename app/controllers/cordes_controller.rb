class CordesController < ApplicationController
　# ログインしていない場合、top画面のみ表示
  before_action :authenticate_user!,except: [:index]

　# gem kaminari使用のため　＃top画面
  def  index
    @cordes = Corde.page(params[:page]).per(18)
  end

  def new
    @corde = Corde.new
  end

  def show
    @corde = Corde.find(params[:id])
  end

  def create
    @corde = Corde.new(corde_params)
    @corde.user_id = current_user.id
    # バリデーションの為に追記
    if @corde.save
    redirect_to cordes_path
    else
    flash.now[:danger] = '画像を選択して下さい。'
    render :new
    end
  end

  def destroy
    @corde = Corde.find(params[:id])
    @corde.destroy
    redirect_to cordes_path
  end

　# user毎の投稿一覧を表示
  def user_cordes
    # 表示させるuserのidを特定
    path = Rails.application.routes.recognize_path(request.referer)
    @cordes = Corde.where(user_id: path[:id]).page(params[:page]).per(18)
  end

  private

  def corde_params
    params.require(:corde).permit(:title, :caption, :corde_image)
  end

end
