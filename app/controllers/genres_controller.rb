class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = current_user.genres
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    @genre.save
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
