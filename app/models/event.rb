class Event < ActiveRecord::Base

  attr_accessible :airports, :banner_url, :description, :ends, :starts, :subtitle, :title, :subdivision_ids, :vaccs, :weekly, :weekly_hash
  has_and_belongs_to_many :subdivisions
  validates :title, :description, :starts, :ends, :subtitle, :airports, :presence => true

  scope :future, where("ends >= ?", Time.now)
  scope :past, where("ends <= ?", Time.now)

end
