class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新しいジャンルを登録しました"
      redirect_to admin_genres_path
    else
      @genre = Genre.new
      @genres = Genre.all
      flash[:notice] = "ジャンルの登録ができませんでした"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_genres_path
    else
      @genre = Genre.find(params[:id])
      flash[:notice] = "ジャンルの編集ができませんでした"
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
