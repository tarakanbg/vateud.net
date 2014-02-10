class AirportsController < ApplicationController
  def index
  end

  def show
    @pages = Page.main.visible.in_menu
    @icao = params[:id]
    @airport = Airport.find_by_icao(@icao)
    @charts = @airport.charts_from_api
  end
end
