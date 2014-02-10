class CustomChart < ActiveRecord::Base
  attr_accessible :icao, :name, :url
  validates :icao, :url, :name, :presence => true

end
