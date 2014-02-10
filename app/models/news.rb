class News < ActiveRecord::Base
  attr_accessible :author_id, :description, :keywords, :post, :published, :slug, :title

  extend FriendlyId
  friendly_id :title, :use => :slugged
  has_paper_trail

  belongs_to :author, :class_name => "AdminUser", :foreign_key => "author_id"

  scope :published, where(:published => true)
  scope :draft, where(:published => false)

  def url
    '/news/' + self.slug
  end

end
