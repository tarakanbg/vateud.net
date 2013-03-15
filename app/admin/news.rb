ActiveAdmin.register News do

  menu :parent => "Editing", :priority => 2

  scope :published
  scope :draft
  
end
