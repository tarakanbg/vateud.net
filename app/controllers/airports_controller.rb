class AirportsController < ApplicationController
  def index
  end

  def show
    @pages = Page.main.visible.in_menu
    @icao = params[:id]
    @pagetitle = "#{@icao.upcase} Airport Details"
    @airport = Airport.find_by_icao(@icao)
    #@charts = ChartFetcher.new(@icao).charts
    @charts = @airport.charts_from_api
    online = @icao.vatsim_online(:gcmap_width => "340", :gcmap_height => "320")
    @atc = online[:atc]
    @arrivals = online[:arrivals]
    @departures = online[:departures]
  end
end
