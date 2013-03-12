class Page < ActiveRecord::Base
  attr_accessible :abstract, :description, :keywords, :menu, :post, :sidebar, :slug, :title, :visible
  attr_accessible :name, :parent_id, :layout_id

  attr_accessor :url

  acts_as_nested_set  

  belongs_to :layout

  default_scope order('lft ASC')

  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  scope :main, where(:parent_id => nil)
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :in_menu, where(:menu => true)

  def url
    path = ""
    return "/" if self.name.downcase == "home"
    if self.root?
      path += '/' + self.slug
    else
      self.ancestors.each do |ancestor|
        path += '/' + ancestor.slug
      end
      path += '/' + self.slug
    end
    path
  end

end
