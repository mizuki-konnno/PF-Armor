class ClothesController < ApplicationController
  def index
    @clothes = current_user.clothes
  end

  def new
    @clothe = Clothe.new
  end

end
