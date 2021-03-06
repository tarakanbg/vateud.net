class CountriesController < ApplicationController
  def index
    @pagetitle = "Countries and vACCs"
    @pages = Page.main.visible.in_menu
    @squawks = Squawk.all
    @countries = Country.eud.reorder("name ASC")
  end

  def show
    @pages = Page.main.visible.in_menu
    @countries = Country.eud.reorder("name ASC")
    if params[:id] == "EU"
      @pagetitle = "Eurocontrol vACC Details"
      @subdivision = Subdivision.find_by_code("EUC")
      render "eurocontrol" and return
    else
      @country = Country.where(:code => params[:id]).first
      @pagetitle = "#{@country.name} Country Details"
      unless @country.subdivision
        render "open_sky" and return
      end
    end
  end
end
