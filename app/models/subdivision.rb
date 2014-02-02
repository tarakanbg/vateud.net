class Subdivision < ActiveRecord::Base

  attr_accessible :code, :introtext, :name, :website, :hidden, :official, :country_ids, :frequency_countries
  attr_accessor :frequencies
  default_scope order('name ASC')
  # has_many :staff, :foreign_key => 'vacc_code', :primary_key => "code"
  # has_many :admin_users
  has_many :countries, :inverse_of => :subdivision
  has_and_belongs_to_many :events
  has_many :staff_members, :primary_key => 'code', :foreign_key => 'vacc_code'
  # has_one :custom_chart_source

  validates :code, :name, :website, :introtext, :presence => true

  scope :active, where(:hidden => false)
  scope :official, where(:official => true)


  def frequencies
    ids = self.frequency_countries.split(",").map { |s| s.to_i }
    Frequency.where("country IN (?)", ids)
  end

  

end
