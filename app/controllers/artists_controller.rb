class ArtistsController < ApplicationController

  def index
    require 'pry'; binding.pry
    @artists = Artist.all 
  end

  def new 

  end

  def create
    artist = Artist.create!(artist_params)
    redirect_to "/artists"
  end

  
  def edit
    @artist = Artist.find(params[:id])
  end
  
  def update 
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy 
    redirect_to '/artists'
  end

private 
  def artist_params
    params.permit(:name)#you can put other params in here if artist as more attritbutes
  end
end