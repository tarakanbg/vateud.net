#encoding: utf-8
class Squawk < ActiveRecord::Base

  self.abstract_class = true

  establish_connection("freq")
  
  set_table_name "squawks"

  attr_accessible :facility, :position, :start, :end

  default_scope order('facility ASC')

end
