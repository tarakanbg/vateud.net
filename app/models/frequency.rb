#encoding: utf-8
class Frequency < ActiveRecord::Base

  self.abstract_class = true
  self.inheritance_column = :_type_disabled

  establish_connection("freq")

  set_table_name "frequencies"

  attr_accessible :id, :country, :name, :airport, :callsign, :freq

  default_scope order('callsign ASC')

  belongs_to :frequency_country, :foreign_key => 'id', :primary_key => "country"

  excluded_ids = [40,41,42,43]

  scope :european, where("country NOT IN (?)", excluded_ids)

end
