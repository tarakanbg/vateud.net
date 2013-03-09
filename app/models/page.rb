class Page < ActiveRecord::Base
  attr_accessible :abstract, :description, :keywords, :menu, :post, :sidebar, :slug, :title, :visible, :name, :parent_id

  acts_as_nested_set

  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  scope :main, where(:parent_id => nil)
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)

end
