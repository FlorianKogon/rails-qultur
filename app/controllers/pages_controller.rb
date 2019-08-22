class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @monuments = Monument.all
      if params[:query] && params[:query][:address]
        @monuments = @monuments.near(params[:query][:address], 30)
      end
    @markers = @monuments.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        infoWindow: render_to_string(partial: "monuments/info_window", locals: { monument: monument })
      }
    end
  end
end
