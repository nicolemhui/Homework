class AlbumsController < ApplicationController
  def new
    @bands = Band.all
  end

  def show

  end

  def edit
  end

  def create

  end

  def update

  end

  def destroy
    album = Album.find(params[:album][:id])
    album.destroy
  end

end
