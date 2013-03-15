class News < ActiveRecord::Base
  attr_accessible :author_id, :description, :keywords, :post, :published, :slug, :title

  extend FriendlyId
  friendly_id :title, :use => :slugged  
  
  scope :published, where(:published => true)
  scope :draft, where(:published => false)

end
