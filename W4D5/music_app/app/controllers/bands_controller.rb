class BandsController < ApplicationController
  def new
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    band = Band.new(params[:id])
    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.name = params[:band][:name]
    @band.save
    redirect_to band_url(@band)
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
end
