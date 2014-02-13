class Country < ActiveRecord::Base
  attr_accessible :code, :name, :subdivision_id, :eud
  attr_accessor :frequencies
  belongs_to :subdivision, :inverse_of => :countries
  has_many :airports
  belongs_to :frequency_country, :inverse_of => :country

  validates :code, :name, :presence => true

  scope :eud, -> { where(eud: true) }

  def frequencies
    self.frequency_country.frequencies
  end

  # default_scope order('name DESC')


end
