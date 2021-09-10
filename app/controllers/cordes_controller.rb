class CordesController < ApplicationController

  before_action :authenticate_user!,except: [:index]

  def  index
    @cordes = Corde.all
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
    @corde.save
    redirect_to cordes_path
  end

  def destroy
    @corde = Corde.find(params[:id])
    @corde.destroy
    redirect_to cordes_path
  end

  private

  def corde_params
    params.require(:corde).permit(:title, :caption, :corde_image)
  end

end
