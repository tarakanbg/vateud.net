class Airport < ActiveRecord::Base
  attr_accessible :country_id, :icao, :major, :iata, :scenery_fs9_link, :scenery_fsx_link,
                  :scenery_xp_link, :description

  has_paper_trail

  validates :icao, :country_id, :iata, :presence => true
  validates :icao, :uniqueness => true
  validates_length_of :icao, :maximum => 4, :minimum => 4
  validates_length_of :iata, :maximum => 3, :minimum => 3

  belongs_to :country

  before_save :upcase_icao


  def upcase_icao
    self.icao = self.icao.upcase
  end

  def data
    Airdata::Airport.find_by_icao(self.icao.upcase)
  end

  def charts_from_api
    response = Faraday.get("http://api.vateud.net/charts/#{self.icao}.json")
    JSON.parse(response.body)
  end




end
