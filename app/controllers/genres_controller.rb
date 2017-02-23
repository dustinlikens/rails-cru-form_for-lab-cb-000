class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(white_params)
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(white_params)
    @genre.save
    redirect_to genre_path(@genre)
  end

  def delete
    @genre = Genre.find(params[:id])
    @genre.delete
    redirect_to genres_path
  end

  private 

  def white_params
    params.require(:genre).permit(:name)
  end
end