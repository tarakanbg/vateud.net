class Layout < ActiveRecord::Base
  attr_accessible :name, :priority

  has_many :pages

  default_scope order('priority ASC')
end
