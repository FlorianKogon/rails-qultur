class MonumentsController < ApplicationController
  def index
    @monuments = Monument.geocoded # returns monuments with coordinates

    @markers = @monuments.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude
      }
    end
  end

  def show
    @monument = Monument.find(params[:id])
  end
end
