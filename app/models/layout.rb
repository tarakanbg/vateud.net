class Layout < ActiveRecord::Base
  attr_accessible :name, :priority

  has_many :pages
  has_paper_trail

  default_scope order('priority ASC')
end
