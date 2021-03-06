class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    flash[:notice] = "ジャンルを追加しました"
    redirect_to genres_path
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    flash[:notice] = "変更を保存しました"
    redirect_to genres_path
  end
  
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path 
  end

  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
